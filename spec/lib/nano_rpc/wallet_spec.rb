# frozen_string_literal: true

require 'spec_helper'

RSpec.describe NanoRpc::Wallet do
  subject(:wallet) { described_class.new(wallet_id) }

  let(:wallet_id) { 'E929FBC3' }
  let(:expected_proxy_methods) do
    %i[
      account_create
      account_list
      account_remove
      accounts_create
      password_change
      password_enter
      password_valid
      payment_begin
      payment_end
      payment_init
      receive
      search_pending
      send
      wallet_add
      wallet_add_watch
      wallet_balances
      wallet_change_seed
      wallet_contains
      wallet_destroy
      wallet_export
      wallet_frontiers
      wallet_history
      wallet_info
      wallet_ledger
      wallet_locked
      wallet_pending
      wallet_representative
      wallet_representative_set
      wallet_republish
      wallet_work_get
      work_get
      work_set
    ]
  end
  let(:expected_proxy_params) { { wallet: :id } }

  it 'defines proxy params' do
    expect(wallet.proxy_params).to eq(expected_proxy_params)
  end

  it 'defines proxy methods' do
    expect(wallet.proxy_methods.keys).to eq(expected_proxy_methods)
  end

  it 'raises MissingParameters unless initialized with string' do
    expect { described_class.new }.to raise_error(
      NanoRpc::MissingParameters, 'Missing argument: id (str)'
    )
  end

  it 'assigns id on initialization' do
    expect(wallet.id).to eq(wallet_id)
  end

  it 'has a custom #inspect' do
    expect(wallet.inspect).to include("@id=\"#{wallet.id}\"")
  end
end
