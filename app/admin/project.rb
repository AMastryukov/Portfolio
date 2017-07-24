ActiveAdmin.register Project do
  permit_params :title, :body, :image

  show do |t|
    attributes_table do
      row :title
      row :body
      row :image do
        project.image? ? image_tag(project.image.url, height: '100') : content_tag(:span, "No image yet")
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :image, hint: f.project.image? ? image_tag(project.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF")
    end
    f.actions
  end
end
