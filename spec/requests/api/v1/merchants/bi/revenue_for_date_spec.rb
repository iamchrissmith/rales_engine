require 'rails_helper'

describe "BI API - Merchant Revenue for Date" do
  context 'GET /api/v1/merchants/revenue?date=x' do
    let (:merchants) { create_list(:merchant, 2) }

    let (:m0_invoice) { create(:invoice, :with_transactions, merchant: merchants[0], created_at: '2012-03-16 11:55:05') }
    let! (:m0i_invoiceitems) { create_list(:invoice_item, 3, invoice: m0_invoice) }

    let (:m1_invoice) { create(:invoice, :with_transactions, merchant: merchants[1], created_at: '2012-03-16 11:55:05') }
    let! (:m1i_invoiceitems) { create_list(:invoice_item, 3, invoice: m1_invoice) }

    let (:off_date_invoice) { create(:invoice, :with_transactions, merchant: merchants[1]) }
    let! (:off_date_invoiceitems) { create_list(:invoice_item, 3, invoice: off_date_invoice) }

    it 'returns the total revenue for date x across all merchants' do
      get '/api/v1/merchants/revenue?date=2012-03-16 11:55:05'

      expect(response).to be_success

      total_revenue = JSON.parse(response.body)

      expect(total_revenue).to have_key("total_revenue")
      expect(total_revenue["total_revenue"]).to eq "0.06"
    end
  end
end
