require 'rails_helper'

RSpec.describe TodoController, type: :controller do

  let!(:todos) { create_list(:todo, 10) }
  let(:todo_id) { todos.first.id }

  describe "GET /todo" do
    before { get :index }

    it "return todo list" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "return status code 200" do
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /todo" do
    let(:valid_attributes) { { titulo: 'Learn Elm' } }

    context "when the request is valid" do
      before { post :create, params: valid_attributes }

      it "create a todo" do
        expect(json['titulo']).to eq('Learn Elm')
      end

      it "return 201 code" do
        expect(response).to have_http_status(:created)
      end
    end

    context "when the request is not valid" do
      before { post :create, params: {titulo: nil} }

      it "returns status code 422" do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "return a failure message" do
        expect(response.body).to match(/Validation failed: Titulo can't be blank/)
      end
    end
  end

  describe "GET /todo/:id" do
    before { get :show, params: {id: todo_id} }

    context "when the record exist" do
      it "return the todo" do
        expect(json).not_to be_empty
      end

      it "return the status code 200" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "when the record does not exist" do
      let(:todo_id) { 100000 }

      it "return a not found message" do
        expect(response.body).to match(/Couldn't find Todo/)
      end

      it "return the status code 404" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "PUT /todo/:id" do
    let(:valid_attributes) { { id: todo_id, titulo: 'Shopping' } }
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

  describe "DELETE /todo/:id" do
    before { delete :destroy, params: {id: todo_id} }

    it "return code 204" do
      expect(response).to have_http_status(:no_content)
    end
  end

end
