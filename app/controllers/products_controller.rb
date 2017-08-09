class ProductsController < ApplicationController
=begin 
index 
	Role - is to list resources / data 
	path - products_path
	URI - /products
	HTTP Method - GET

new 
	Role - is to instantiate an object, and setup a form
	path - new_product_path
	URI - /products/new
	HTTP Method - GET

create
  Role - is to take the values coming in from the form and save it to the database if the validations pass, else display error message
  path - products_path
  URI - /products
  HTTP Method - POST 

show
	Role - is to find the data and display its details on the show page, along with it also to display is associated data
	path - product_path(:id)
	URI - /products/:id
	HTTP Mehtod - GET

edit
	Role - is to find the record from the db and display the details inside a form 
	Path - edit_product_path(:id)
	URI - /products/:id/edit
	HTTP Method - GET

update
  Role - is to find the record from the db the user is trying to update. and update the values of the record with the parameters coming in from the form if the validations pass, else display the error msg
  Path - product_path(:id)
  URI - /products/:id
  HTTP Method - PATCH

destroy 
	Role - is to find the record from the db and delete it, once deleted redirect the user to a new page. 
	Path - product_path(:id)
	URI - /products/:id
	HTTP Method - DELETE 
=end

def index
	@products = Product.all
end

def new
	@product = Product.new 
end

def create 
	@product = Product.new(params[:product].permit(:name, :category_id, :description, :price))
	if @product.save 
		redirect_to products_path, notice: "Successfully created product"
	else
		render action: "new"
	end
end

def show
	@product = Product.find(params[:id])
	# @category = Category.find(@product.category_id)
end

def edit
	@product = Product.find(params[:id])
end

def update
	@product = Product.find(params[:id])
	if @product.update_attributes(params[:product].permit(:name, :category_id, :description, :price))
		redirect_to product_path(@product.id), notice: "Successfully updated the product"
	else
		render action: "edit"
	end
end

def destroy
	@product = Product.find(params[:id])
	@product.destroy
	redirect_to products_path, notice: "Successfully destroyed the product"
end

end
