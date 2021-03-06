require 'rails_helper'

describe 'Invoice_Items Find API' do
  context 'GET /api/v1/invoice_items/find' do
    context '?id=' do
      it 'returns the invoice_item with that primary key' do
        invoice_item = create(:invoice_item)

        get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

        raw_invoice_item = JSON.parse(response.body)

        expect(response).to be_success
        expect(raw_invoice_item["id"]).to eq(invoice_item.id)
      end

      it 'returns error when no matching primary key' do
        invoice_item = create(:invoice_item)

        get "/api/v1/invoice_items/find?id=#{invoice_item.id + 1}"

        raw_invoice_item = JSON.parse(response.body)

        expect(raw_invoice_item['error']).to eq 'not found'
      end
    end

    context '?invoice_id=' do
      it 'returns the first invoice with that invoice_id' do
        invoice_item = create(:invoice_item)

        get "/api/v1/invoice_items/find?invoice_id=#{invoice_item.invoice_id}"

        raw_invoice_item = JSON.parse(response.body)

        expect(response).to be_success
        expect(raw_invoice_item["id"]).to eq(invoice_item.id)
      end

      it 'returns error when no matching invoice_id' do
        invoice_item = create(:invoice_item)

        get "/api/v1/invoice_items/find?invoice_id=#{invoice_item.invoice_id + 1}"

        raw_invoice_item = JSON.parse(response.body)

        expect(raw_invoice_item['error']).to eq 'not found'
      end
    end

    context '?item_id=' do
      it 'returns the first invoice with that item_id' do
        invoice_item = create(:invoice_item)

        get "/api/v1/invoice_items/find?item_id=#{invoice_item.item_id}"

        raw_invoice_item = JSON.parse(response.body)

        expect(response).to be_success
        expect(raw_invoice_item["id"]).to eq(invoice_item.id)
      end

      it 'returns error when no matching item_id' do
        invoice_item = create(:invoice_item)

        get "/api/v1/invoice_items/find?item_id=#{invoice_item.item_id + 1}"

        raw_invoice_item = JSON.parse(response.body)

        expect(raw_invoice_item['error']).to eq 'not found'
      end
    end

    context '?unit_price=' do
      it 'returns the invoice_item with that unit_price' do
        invoice_item = create(:invoice_item)

        get "/api/v1/invoice_items/find?unit_price=#{invoice_item.unit_price}"

        raw_invoice_item = JSON.parse(response.body)

        expect(response).to be_success
        expect(raw_invoice_item["id"]).to eq(invoice_item.id)
      end

      it 'returns error when no matching unit_price' do
        invoice_item = create(:invoice_item)

        get "/api/v1/invoice_items/find?unit_price=0.00"

        raw_invoice_item = JSON.parse(response.body)

        expect(raw_invoice_item['error']).to eq 'not found'
      end
    end

    context '?quantity=' do
      it 'returns the invoice_item with that quantity' do
        invoice_item = create(:invoice_item)

        get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity}"

        raw_invoice_item = JSON.parse(response.body)

        expect(response).to be_success
        expect(raw_invoice_item["id"]).to eq(invoice_item.id)
      end

      it 'returns error when no matching quantity' do
        invoice_item = create(:invoice_item)

        get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity + 1}"

        raw_invoice_item = JSON.parse(response.body)

        expect(raw_invoice_item['error']).to eq 'not found'
      end
    end

    context '?created_at=' do
      it 'returns the first invoice with that created_at'do
        invoice = create(:invoice_item)

        get "/api/v1/invoice_items/find?created_at=#{invoice.created_at}"

        raw_invoice_item = JSON.parse(response.body)

        expect(raw_invoice_item['id']).to eq invoice.id

        expect(response).to be_success
        expect(raw_invoice_item["id"]).to eq(invoice.id)
      end

      it 'returns error when not valid created_at' do
        invoice = create(:invoice_item)

        get "/api/v1/invoice_items/find?created_at=2018-01-01 00:00:00"

        raw_invoice_item = JSON.parse(response.body)

        expect(raw_invoice_item['error']).to eq 'not found'
      end
    end

    context '?updated_at=' do
      it 'returns the first invoice with that updated_at' do
        invoice_item = create(:invoice_item)

        get "/api/v1/invoice_items/find?updated_at=#{invoice_item.updated_at}"

        raw_invoice_item = JSON.parse(response.body)

        expect(raw_invoice_item['id']).to eq invoice_item.id

        expect(response).to be_success
        expect(raw_invoice_item["id"]).to eq(invoice_item.id)
      end

      it 'returns error when not valid updated_at' do
        invoice_item = create(:invoice_item)

        get "/api/v1/invoice_items/find?updated_at=2018-01-01 00:00:00"

        raw_invoice_item = JSON.parse(response.body)

        expect(raw_invoice_item['error']).to eq 'not found'
      end
    end

  end
end
