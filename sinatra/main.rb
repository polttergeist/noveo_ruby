require "sinatra"
require "csv"

get "/" do
	redirect "/products"
end

get "/products" do
	erb :index
end

get '/product_page/:id' do
	id = params[:id]
	erb :product_patch, :locals => { :id => params[:id] }
end

get '/product_page' do
	erb :product_post, :locals => { :id => nil }
end

post "/product_page" do
	unless params.values.any?(&:empty?)
		File.write('products.csv', "#{params[:name]},#{params[:price]},#{params[:count]},#{params[:creator]}\n", mode: "a+")
		redirect "/"
	end
	"There's an empty field!!!!!"
end

patch "/product_page" do
	unless params.values.any?(&:empty?)
		csv = File.open('products.csv', 'r').readlines
		csv[params[:id].to_i] = "#{params[:name]},#{params[:price]},#{params[:count]},#{params[:creator]}\n"
		File.open('products.csv', "w") {|file| file.write(csv.join) }
		redirect "/"
	end
	"There's an empty field!!!!!"
end

delete "/products" do
	csv = File.open('products.csv', 'r').readlines
	csv[params[:id].to_i] = ""
	File.open('products.csv', "w") {|file| file.write(csv.join) }
	redirect "/"
end
