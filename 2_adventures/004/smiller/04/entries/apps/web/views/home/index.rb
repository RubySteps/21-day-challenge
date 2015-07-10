module Web::Views::Home
  class Index
    include Web::View

    def form
      form_for :entry, "/" do
        textarea :body, cols: "80", rows: "40"
        hr
        submit "Preview"
      end
    end
  end
end
