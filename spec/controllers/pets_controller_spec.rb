require 'spec_helper'

describe PetsController do

  def mock_pet(stubs={})
    @mock_pet ||= mock_model(Pet, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all pets as @pets" do
      Pet.stub(:all) { [mock_pet] }
      get :index
      assigns(:pets).should eq([mock_pet])
    end
  end

  describe "GET show" do
    it "assigns the requested pet as @pet" do
      Pet.stub(:find).with("37") { mock_pet }
      get :show, :id => "37"
      assigns(:pet).should be(mock_pet)
    end
  end

  describe "GET new" do
    it "assigns a new pet as @pet" do
      Pet.stub(:new) { mock_pet }
      get :new
      assigns(:pet).should be(mock_pet)
    end
  end

  describe "GET edit" do
    it "assigns the requested pet as @pet" do
      Pet.stub(:find).with("37") { mock_pet }
      get :edit, :id => "37"
      assigns(:pet).should be(mock_pet)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created pet as @pet" do
        Pet.stub(:new).with({'these' => 'params'}) { mock_pet(:save => true) }
        post :create, :pet => {'these' => 'params'}
        assigns(:pet).should be(mock_pet)
      end

      it "redirects to the created pet" do
        Pet.stub(:new) { mock_pet(:save => true) }
        post :create, :pet => {}
        response.should redirect_to(pet_url(mock_pet))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pet as @pet" do
        Pet.stub(:new).with({'these' => 'params'}) { mock_pet(:save => false) }
        post :create, :pet => {'these' => 'params'}
        assigns(:pet).should be(mock_pet)
      end

      it "re-renders the 'new' template" do
        Pet.stub(:new) { mock_pet(:save => false) }
        post :create, :pet => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested pet" do
        Pet.should_receive(:find).with("37") { mock_pet }
        mock_pet.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :pet => {'these' => 'params'}
      end

      it "assigns the requested pet as @pet" do
        Pet.stub(:find) { mock_pet(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:pet).should be(mock_pet)
      end

      it "redirects to the pet" do
        Pet.stub(:find) { mock_pet(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(pet_url(mock_pet))
      end
    end

    describe "with invalid params" do
      it "assigns the pet as @pet" do
        Pet.stub(:find) { mock_pet(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:pet).should be(mock_pet)
      end

      it "re-renders the 'edit' template" do
        Pet.stub(:find) { mock_pet(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested pet" do
      Pet.should_receive(:find).with("37") { mock_pet }
      mock_pet.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pets list" do
      Pet.stub(:find) { mock_pet }
      delete :destroy, :id => "1"
      response.should redirect_to(pets_url)
    end
  end

end
