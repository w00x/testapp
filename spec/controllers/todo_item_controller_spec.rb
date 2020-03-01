require 'rails_helper'

RSpec.describe TodoItemController, type: :controller do
  let!(:todo_items) { create_list(:todo_item, 10) }
  let(:todo_id) { todo_items.first.todo_id }
  let(:todo_item_id) { todo_items.first.id }

  describe "GET /todo_item" do
    before { get :index }

    it "return todo item list" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "return status code 200" do
      expect(response).to have_http_status(:ok)
    end

  end

  describe "POST /todo_item" do
    let(:valid_attributes) { { descripcion: 'Lalala', hecho: false, todo_id: todo_id } }

    context "when the request is valid" do
      before { post :create, params: valid_attributes }

      it "create a todo" do
        expect(json['descripcion']).to eq('Lalala')
      end

      it "return 201 code" do
        expect(response).to have_http_status(:created)
      end
    end

    context "when the request is not valid" do
      before { post :create, params: { descripcion: nil, hecho: false, todo_id: todo_id } }

      it "returns status code 422" do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "return a failure message" do
        expect(response.body).to match(/Descripcion can't be blank/)
      end
    end
  end

  describe "GET /todo_item/:id" do
    before { get :show, params: {id: todo_item_id} }

    context "when the record exist" do
      it "return the todo item" do
        expect(json).not_to be_empty
      end

      it "return the status code 200" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "when the record does not exist" do
      let(:todo_item_id) { 100000 }

      it "return a not found message" do
        expect(response.body).to match(/Couldn't find TodoItem/)
      end

      it "return the status code 404" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "UPDATE /todo_item/:id" do
    let(:valid_attributes) { { id: todo_item_id, descripcion: 'Shopping' } }
    before { put :update, params: valid_attributes }

    context "when the record exist" do
      it "update the record" do
        expect(response.body).to be_empty
      end

      it "return status code 204" do
        expect(response).to have_http_status(:no_content)
      end
    end
  end

  describe "DELETE /todo_item/:id" do
    before { delete :destroy, params: {id: todo_item_id} }

    it "return code 204" do
      expect(response).to have_http_status(:no_content)
    end
  end
end
