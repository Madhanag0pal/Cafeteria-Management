module SalesReportHelper
  def sales_data
    tital_orders = Order.group_by_day(:created_at).total
    [
      { name: "Total orders", data: Order.group_by_day(:created_at).total },
      { name: "Delivered orders", data: Order.delevered.group_by_day(:created_at).total },
      { name: "Cancelled orders", data: Order.canceled.group_by_day(:created_at).total },
    ]
  end

  def product_data
    OrderItem.group(:name).quantity.sort { |p1, p2| p2[1] <=> p1[1] }
  end
end
