# frozen_string_literal: true
module Nano::AccountsProxyHelper
  def balances
    accounts_balances.balances
  end

  def create(wallet:, count:, work: nil)
    accounts_create(wallet: wallet, count: count, work: work).accounts
  end

  def frontiers
    accounts_frontiers.frontiers
  end

  def pending(count:, threshold: nil, source: nil)
    accounts_pending(count: count, threshold: threshold, source: source).blocks
  end
  alias pending_blocks pending

  # Array-like access for Nano::Account
  def [](idx)
    return unless @addresses[idx]
    @account_objects ||= []
    @account_objects[idx] ||= Nano::Account.new(@addresses[idx])
  end

  def <<(val)
    @addresses << val
  end

  def each(&_block)
    @addresses.each do |address|
      yield Nano::Account.new(address)
    end
  end

  def first
    self[0]
  end

  def second
    self[1]
  end

  def third
    self[2]
  end
end