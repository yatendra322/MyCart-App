function add_to_cart(pId, pName, pPrice) {
	let cart = localStorage.getItem("cart");
	if (cart == null) {
		//no cart yet
		let products = [];
		let product = { productId: pId, pruductName: pName, productQuantity: 1, productPrice: pPrice };
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		//console.log("Product is added for the first time")
		showToast("Item is added to cart")
	}
	else {
		//cart is already present
		let pcart = JSON.parse(cart);
		let oldProduct = pcart.find((item) => item.productId == pId)
		if (oldProduct) {
			//we have to increase the quantity
			oldProduct.productQuantity = oldProduct.productQuantity + 1;
			pcart.map((item) => {
				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity;
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			//console.log("Product quantity is increased");
			showToast(oldProduct.pruductName+" quantity is increased ")

		}
		else {
			//we have add the quantity
			let product = { productId: pId, pruductName: pName, productQuantity: 1, productPrice: pPrice };
			pcart.push(product)
			localStorage.setItem("cart", JSON.stringify(pcart));
			//console.log("Product is added")
			showToast("Product is added")
		}

	}
	updateCart();
}

// update cart
function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	let totalPrice=0;
	if (cart == null || cart.length == 0) {
		console.log("Cart is empty");
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3> Cart does not have any items </h3>");
		$(".checkout-btn").attr('disabled',true);

	}
	else {
		//there is some in cart to show
		//console.log(cart);
		$(".cart-items").html(cart.length);
		let g ="<table class='table'>";
			g=g+"<thead>";
			g=g+"<tr>";
			g=g+"<th class='prop__name' data-prop-name='firstName'>Item Name</th>";
			g=g+"<th class='prop__name' data-prop-name='lastName'>Price</th>";	
			g=g+"<th class='prop__name' data-prop-name='birth'>Quantity</th>";
			g=g+"<th class='prop__name' data-prop-name='birth'>Total Price</th>";
			g=g+"<th class='prop__name' data-prop-name='birth'>Action</th>";
			g=g+"</tr>";
			g=g+"</thead >";
			
			cart.map((item) => {
				let itemId=item.productId;
				let itemName= item.pruductName;
				let itemPrice=item.productPrice;
				let itemQuantity=item.productQuantity;
				let itemTotalPrce=item.productPrice*item.productQuantity;
				totalPrice=totalPrice+item.productPrice*item.productQuantity;
				g=g+"<tr>";
				g=g+"<td> "+ itemName +"</td>";
				g=g+"<td> "+itemPrice+"</td>";
				g=g+"<td>"+itemQuantity+"</td>";
				g=g+"<td>"+itemTotalPrce+"</td>";
				g=g+"<td><button onclick='deleteItemFromCart("+itemId+")' class='btn btn-danger btn-sm'>Remove</button></td>";
				g=g+"</tr>";
				
			});
			g=g+"<tr><td colspan='5' class='text-right font-text-bold m-5'>"+"Total Price : "+totalPrice+"</td></tr>";
			g=g+"</table >";
			$(".cart-body").html(g);
			$(".checkout-btn").attr('disabled',false);
	}
}
//delete item
function deleteItemFromCart(pId)
{
	let cart=JSON.parse(localStorage.getItem('cart'));
	let newCart=cart.filter((item)=>item.productId !=pId);
	localStorage.setItem('cart',JSON.stringify(newCart));
	updateCart();
	showToast("Item is removed from cart");
}

$(document).ready(function() {
	updateCart();
})


function showToast(content){
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(()=>{
		$("#toast").removeClass("display");
	},2000);
}


function goToCheckout()
{
	window.location="checkout.jsp";
}








