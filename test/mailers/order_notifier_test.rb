require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Order Confirmation", mail.subject
    assert_equal ["mail@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x McFarlane NBA Figure/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Order Shipped", mail.subject
    assert_equal ["mail@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1&times;\s* McFarlane NBA Figure/, mail.body.encoded
  end

end
