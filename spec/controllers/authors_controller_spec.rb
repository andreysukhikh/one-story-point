require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  describe '#index' do
    subject(:index) { get :index }

    let!(:authors) { FactoryBot.create_list :author, 5 }

    it { is_expected.to render_template(:index) }

    it 'assigns @authors' do
      index
      expect(assigns(:authors)).to eq(authors)
    end
  end

  describe '#show' do
    subject(:show) { get :show, params: params }

    let!(:author) { FactoryBot.create :author }
    let!(:books) { FactoryBot.create_list(:book, 5, author_id: author.id) }
    let(:params) do
      { id: author }
    end

    it { is_expected.to render_template(:show) }

    it 'assigns @author' do
      show
      expect(assigns(:author)).to eq(author)
      expect(assigns(:books)).to eq(books)
    end
  end

  describe '#new' do
    subject(:new) { get :new }

    it { is_expected.to render_template(:new) }

    it 'assigns server policy' do
      new
      expect(assigns(:author)).to be_a_new Author
    end
  end

  describe '#create' do
    subject(:create) { post :create, params: params }

    let(:params) do
      { author: FactoryBot.attributes_for(:author) }
    end

    it 'create author' do
      expect { create }.to change(Author, :count).by(1)
      expect(create).to redirect_to(author_path(Author.last))
    end
  end

  describe '#edit' do
    subject(:edit) { get :edit, params: params }

    let!(:author) { FactoryBot.create :author }
    let(:params) do
      { id: author.id }
    end

    it { is_expected.to render_template(:edit) }

    it 'assigns server policy' do
      edit
      expect(assigns(:author)).to eq author
    end
  end

  describe '#update' do
    subject(:update) { put :update, params: params }

    let!(:author) { FactoryBot.create :author }
    let!(:stubbed_author) { FactoryBot.build_stubbed :author }

    context 'when update fullname' do
      let(:params) do
        {
          id: author.id,
          author: {
            fullname: stubbed_author.fullname
          }
        }
      end

      it 'updated' do
        expect { update }.to(change { author.reload.fullname }.to(stubbed_author.fullname))
      end
    end
  end

  describe '#destroy' do
    subject(:destroy) { delete :destroy, params: params }

    let!(:author) { FactoryBot.create :author }
    let(:params) do
      {
        id: author.id
      }
    end

    it 'remove author' do
      expect { destroy }.to change(Author, :count).by(-1)
      expect(destroy).to redirect_to(authors_path)
    end
  end
end
