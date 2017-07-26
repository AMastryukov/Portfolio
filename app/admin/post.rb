ActiveAdmin.register Post do
  permit_params :title, :body, :image, image_attributes: [:_destroy]

  show do |t|
    attributes_table do
      row :title
      row (:body) {raw (post.body)}
      row :image do
        post.image? ? image_tag(post.image.url, height: '100') : content_tag(:span, "No image yet")
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :image, hint: f.post.image? ? image_tag(post.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF")
      if f.object.image.present?
        f.semantic_fields_for :image_attributes do |image_fields|
          image_fields.input :_destroy, as: :boolean, label: 'Delete Image'
        end
      end
    end
    f.actions
  end
end
