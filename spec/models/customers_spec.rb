require 'rails_helper'

RSpec.describe Customer, type: :model do
  # fixtures :customers

  # it 'Creates a customer' do
  #   customer = customers(:mateus)
  #   expect(customer.full_name).to eq("Sr. #{customers(:mateus).name}")
  # end

  # it '#full_name' do
  #   customer = create(:customer)
  #   expect(customer.full_name).to eq("Sr. #{customer.name}")
  #  end

  it '#full_name - Sobrescrevendo atributo' do
    customer = create(:customer, name: 'Mateus')

    expect(customer.full_name).to eq('Sr. Mateus')
  end

  it 'Herança: vip' do
    customer = create(:customer_vip)
    expect(customer.vip).to be_truthy
    expect(customer.days_to_pay).to eq(30)
  end

  it 'Herança: customer_default' do
    customer = create(:customer_default)
    expect(customer.vip).to be(false)
    expect(customer.days_to_pay).to eq(15)
  end

  it '#full_name' do
    customer = create(:user)
    expect(customer.full_name).to start_with('Sr. ')
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }

  it 'Usando o attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to eq("Sr. #{customer.name}")
  end

  it 'Atributo Transitorio' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Cliente VIP Masculino' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to be_truthy
  end

  it 'travel_to' do
    travel_to Time.zone.local(2004, 11, 24, 0o1, 0o4, 44) do
      @customer = create(:customer_vip)
    end
    puts @customer.created_at
    puts Time.now
    expect(@customer.created_at).to eq(Time.new(2004, 11, 24, 0o1, 0o4, 44))
    expect(@customer.created_at).to be < Time.now
  end
end
