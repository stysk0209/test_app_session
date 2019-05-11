class CartsController < ApplicationController

  def new
  	unless session[:carts]
    #sessionに情報がある場合は、式の中を参照しない
  		session[:carts] = {}
  	end
  end

  def test #sessionに情報を保存するアクション
  	cart = Cart.new
    cart.item_price = 0
    #カートに入れた商品の値を代入
  	if session[:carts] == {}
      #sessionの中に情報がない場合は、"item_id"キーをハッシュ形式の情報に与えて保存します。
  		session[:carts]["item_id"] = cart
  	else
  		if session[:carts].include?("item_id")
        #実装段階では、"item_id"にカートに入れる商品のidを引数として与えます。
  			session[:carts]["item_id"]["item_price"] += 100
         #session[:carts]の中にある、"item_id"というキーを持つハッシュ形式の値の中の、
         #"item_price"というキーの値に100を足します。
      end
  	end
  	redirect_to "/view"
  end

  def view
  end

  def create #sessionに一時保存した情報を、DBにINSERT
  	unless session[:carts] == {}
	  	se_info = session[:carts]["item_id"]
	  	cart = Cart.new(se_info)
	  	cart.save
	  	session[:carts] = {}
    end
	@cart_info = Cart.all
  end

  def destroy
  	session[:carts] = {}
  	redirect_to "/view"
  end

  def db_destroy #DBへ保存した情報を全削除
  	carts = Cart.all
  	carts.each do |cart|
  	 cart.destroy
  	end
  	redirect_to root_path
  end


end
