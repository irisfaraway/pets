require 'test_helper'

# Tests for species
class SpeciesControllerTest < ActionController::TestCase
  setup do
    @new_species = species(:new_species)
    @show_species = species(:show_species)
    @edit_species = species(:edit_species)
    @update_species = species(:update_species)
    @destroy_species = species(:destroy_species)
    @species_for_pets = species(:species_for_pets)
    # Set user and session
    @admin_user = users(:admin_user)
    session[:user_id] = @admin_user.id
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:species)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create species' do
    assert_difference('Species.count') do
      post :create, species: { name: 'Dragon' }
    end

    assert_redirected_to species_path(assigns(:species))
  end

  test 'should show species' do
    get :show, id: @show_species
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @edit_species
    assert_response :success
  end

  test 'should update species' do
    patch :update, id: @update_species, species: { name: @update_species.name }
    assert_redirected_to species_path(assigns(:species))
  end

  test 'should destroy species' do
    assert_difference('Species.count', -1) do
      delete :destroy, id: @destroy_species
    end
    assert_redirected_to species_index_path
  end

  test 'should not destroy species with pets' do
    assert_raise do
      delete :destroy, id: @species_for_pets
    end
  end
end
