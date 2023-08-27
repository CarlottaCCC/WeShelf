require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:user) do
    User.create!(
      email: "test@example.com",
      password: "password",
      password_confirmation: "password",
      username: "testuser"
    )
  end
 
  let(:valid_attributes) {
    {
      titolo: "Test Book",
      trama: "This is a test book",
      tag: "test",
      genere: "fiction",
      user_id: user.id
    }
  }

  let(:invalid_attributes) {
    {
      titolo: "",
      trama: "",
      tag: "",
      genere: "",
      user_id: nil
    }
  }

  before do
    request.env['warden'] = instance_double(Warden::Proxy, authenticate!: user, authenticated?: true, user: user)
  end


  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET #index" do
    it "assigns all books as @books" do
      book = Book.create! valid_attributes
      get :index
      expect(assigns(:books)).to eq([book])
    end
  end

  describe "GET #show" do
    it "assigns the requested book as @book" do
      book = Book.create! valid_attributes
      get :show, params: {id: book.to_param}
      expect(assigns(:book)).to eq(book)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Book" do
        expect {
          post :create, params: {book: valid_attributes}
        }.to change(Book, :count).by(1)
      end

      it "assigns a newly created book as @book" do
        post :create, params: {book: valid_attributes}
        expect(assigns(:book)).to be_a(Book)
        expect(assigns(:book)).to be_persisted
      end

      it "redirects to the created book" do
        post :create, params: {book: valid_attributes}
        expect(response).to redirect_to(Book.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved book as @book" do
        post :create, params: {book: invalid_attributes}
        expect(assigns(:book)).to be_a_new(Book)
      end

      it "re-renders the 'new' template" do
        post :create, params: {book: invalid_attributes}
        expect(response).to render_template("errore")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          titolo: "New Test Book",
          trama: "This is a new test book",
          tag: "newtest",
          genere: "non-fiction"
        }
      }

      it "updates the requested book" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: new_attributes}
        book.reload
        expect(book.titolo).to eq("New Test Book")
      end

      it "assigns the requested book as @book" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: valid_attributes}
        expect(assigns(:book)).to eq(book)
      end

      it "redirects to the book" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: valid_attributes}
        expect(response).to redirect_to(book)
      end
    end

    context "with invalid params" do
      it "assigns the book as @book" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: invalid_attributes}
        expect(assigns(:book)).to eq(book)
      end

      it "re-renders the 'edit' template" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested book" do
      book = Book.create! valid_attributes
      expect {
        delete :destroy, params: {id: book.to_param}
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the books list" do
      book = Book.create! valid_attributes
      delete :destroy, params: {id: book.to_param}
      expect(response).to redirect_to(root_path)
    end
  end
end


