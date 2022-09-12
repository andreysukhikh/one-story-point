require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe '#index' do
    subject(:index) { get :index }

    let!(:books) { FactoryBot.create_list :book, 5 }

    it { is_expected.to render_template(:index) }

    it 'assigns @books' do
      index
      expect(assigns(:books)).to eq(books)
    end
  end

  describe '#show' do
    subject(:show) { get :show, params: params }

    let!(:book) { FactoryBot.create :book }
    let(:params) do
      { id: book }
    end

    it { is_expected.to render_template(:show) }

    it 'assigns @book' do
      show
      expect(assigns(:book)).to eq(book)
    end
  end

  describe '#new' do
    subject(:new) { get :new }

    it { is_expected.to render_template(:new) }

    it 'assigns server policy' do
      new
      expect(assigns(:book)).to be_a_new Book
      expect(assigns(:authors)).to eq Author.all
      expect(assigns(:genres)).to eq Genre.all
    end
  end

  describe '#create' do
    subject(:create) { post :create, params: params }

    let(:params) do
      { book: FactoryBot.attributes_for(:book) }
    end

    it 'create book' do
      expect { create }.to change(Book, :count).by(1)
      expect(create).to redirect_to(book_path(Book.last))
    end
  end

  describe '#edit' do
    subject(:edit) { get :edit, params: params }

    let!(:book) { FactoryBot.create :book }
    let(:params) do
      { id: book.id }
    end

    it { is_expected.to render_template(:edit) }

    it 'assigns server policy' do
      edit
      expect(assigns(:book)).to eq book
      expect(assigns(:authors)).to eq Author.all
      expect(assigns(:genres)).to eq Genre.all
    end
  end

  describe '#update' do
    subject(:update) { put :update, params: params }

    let!(:book) { FactoryBot.create :book }
    let!(:stubbed_book) { FactoryBot.build_stubbed :book }

    context 'when update name' do
      let(:params) do
        {
          id: book.id,
          book: {
            name: stubbed_book.name
          }
        }
      end

      it 'updated' do
        expect { update }.to(change { book.reload.name }.to(stubbed_book.name))
      end
    end

    context 'when update shelf' do
      let(:params) do
        {
          id: book.id,
          book: {
            shelf: stubbed_book.shelf
          }
        }
      end

      it 'updated' do
        expect { update }.to(change { book.reload.shelf }.to(stubbed_book.shelf))
      end
    end

    context 'when update description' do
      let(:params) do
        {
          id: book.id,
          book: {
            description: stubbed_book.description
          }
        }
      end

      it 'updated' do
        expect { update }.to(change { book.reload.description }.to(stubbed_book.description))
      end
    end

    context 'when update author' do
      let(:params) do
        {
          id: book.id,
          book: {
            author_id: stubbed_book.author_id
          }
        }
      end

      it 'updated' do
        expect { update }.to(change { book.reload.author_id }.to(stubbed_book.author_id))
      end
    end

    context 'when update genre' do
      let(:params) do
        {
          id: book.id,
          book: {
            genre_id: stubbed_book.genre_id
          }
        }
      end

      it 'updated' do
        expect { update }.to(change { book.reload.genre_id }.to(stubbed_book.genre_id))
      end
    end
  end

  describe '#destroy' do
    subject(:destroy) { delete :destroy, params: params }

    let!(:book) { FactoryBot.create :book }
    let(:params) do
      {
        id: book.id
      }
    end

    it 'remove book' do
      expect { destroy }.to change(Book, :count).by(-1)
      expect(destroy).to redirect_to(books_path)
    end
  end
end
