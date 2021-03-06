# -*- coding: utf-8 -*-

RSpec.describe 'Addition' do
  let!(:x) { 7 }
  let!(:y) { 3 }

  before do
    $driver.find_element(:accessibility_id, 'resetButton').click

    sleep 1
    $driver.find_element(:accessibility_id, 'inputFieldLeft').send_key(x)
    $driver.find_element(:accessibility_id, 'inputFieldRight').send_key(y)

    sleep 1
  end

  it 'add two numbers' do
    $driver.find_element(:accessibility_id, 'additionButton').click
    sleep 1

    result_text = $driver.texts.first.text
    expected_result = "%.2f" % x + " + " + "%.2f" % y + " = " + "%.2f" % (x + y)
    expect(result_text).to eq(expected_result)
  end
end
