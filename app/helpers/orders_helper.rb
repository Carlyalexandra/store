module OrdersHelper
	def current_order
		current_user.orders.any? ? user_order_path(current_user.id, current_user.orders.last.id) : nil
	end
end
