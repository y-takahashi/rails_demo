json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :title, :body, :finished, :expires_at
  json.url ticket_url(ticket, format: :json)
end
