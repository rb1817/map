json.extract! qna, :id, :user_name, :title, :content, :answer_email, :created_at, :updated_at
json.url qna_url(qna, format: :json)
