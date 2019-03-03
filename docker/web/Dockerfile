FROM nginx:alpine

# Set our working directory inside the image
WORKDIR /var/www/rails_test_app

COPY ./docker/web/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
