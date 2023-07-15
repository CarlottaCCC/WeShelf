class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  
  has_many :flags, dependent: :destroy      
  has_many :books, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100,100]
  end

  #has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  #validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  acts_as_followable 
  acts_as_follower
  acts_as_voter

  validates :username, presence: true, uniqueness: true, length: {minimum: 6}
  after_commit :add_default_avatar, on: %i[create update]

         def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0, 20]
            user.username = auth.info.name
            user.full_name = auth.info.name # assuming the user model has a name
            user.avatar_url = auth.info.image # assuming the user model has an image
            #user.confirmed_at = DateTime.now
            user.skip_confirmation!
            user.save!
          end
        end


        #user.avatar.attach(io: File.open("/app/assets/images/default_profile.jpg"), filename: "default_profile.jpg", content_type: "image/jpg")

        # Does the user have an avatar?
        #user.avatar.attached? # => true
        
        # Synchronously destroy the avatar and actual resource files.
        #user.avatar.purge
        
        # Destroy the associated models and actual resource files async, via Active Job.
        #user.avatar.purge_later
        
        # Does the user have an avatar?
        #user.avatar.attached? # => false
        
        # Generate a permanent URL for the blob that points to the application.
        # Upon access, a redirect to the actual service endpoint is returned.
        # This indirection decouples the public URL from the actual one, and
        # allows for example mirroring attachments in different services for
        # high-availability. The redirection has an HTTP expiration of 5 min.
        #url_for(user.avatar)

        def avatar_thumbnail 
          if avatar.attached?
            avatar.variant(resize_to_fill: [150, nil]).processed
          else
             '/default_profile.jpg'
          end
            
        end

        private
        def add_default_avatar 
          unless avatar.attached?
            avatar.attach(
              io: File.open(
                Rails.root.join(
                  'app', 'assets', 'images', 'default_profile.jpg'
                )
              ), 
              filename: 'default_profile.jpg',
              content_type: 'image/jpg'
            )

        end
      end

      def self.search_by(search_term)
        where("LOWER(username) LIKE :search_term", search_term: "%#{search_term.downcase}%")
    end

end
