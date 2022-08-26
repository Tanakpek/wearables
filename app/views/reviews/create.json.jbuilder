if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {wearable: @wearable, review: Review.new})
  json.inserted_item render(partial: "wearables/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {wearable: @wearable, review: @review})
end
