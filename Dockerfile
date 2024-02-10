# Use the nginx:stable as the base image
FROM nginx:stable

# Update and upgrade the installed packages, and install required utilities
RUN apt-get update && \
    apt-get upgrade -y
    
# Expose port 80 to the outside world
EXPOSE 80

# CMD instruction to start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
