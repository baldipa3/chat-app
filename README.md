## Chat-App

I began by styling the application using Tailwind CSS, leveraging a [pre-built responsive header](https://v1.tailwindcss.com/components/navigation#responsive-header) as a template. My goal was to extend this styling throughout the app to achieve a minimalistic and aesthetically pleasing design.

### Create Room Feature (Exploratory)

As a secondary step, I implemented a **Create Room** feature (not required by the initial test) as a playground to explore and better understand **Hotwire** and its ecosystem. This also helped me configure some missing settings for testing purposes.

### Core Functionality

For the app's core functionality, I utilized **ActionCable** and **Hotwire** to enable live updates when submitting messages. Additionally, I implemented a background job to handle message persistence asynchronously, ensuring a smooth and responsive user experience.

*Main extra gems*
- Devise for user authentication
- Rspec as tesring framework

### Bonus points

I tried deploying with Kamal, but I ran into some issues with the Docker setup and getting the database configured. I’m using SQLite locally, and I’m having a bit of trouble setting up the development and production environments properly. The VPS is ready and running, but like I mentioned, something’s off, and I haven’t been able to figure out what it is yet.

### Documentation

- https://v1.tailwindcss.com/components/
- https://blog.appsignal.com/2024/02/21/hotwire-modals-in-ruby-on-rails-with-stimulus-and-turbo-frames.html
- https://dev.to/ayushn21/turbo-streams-meets-action-cable-4poj
- https://hotwired.dev/
- https://guides.rubyonrails.org/action_cable_overview.html
- https://www.hostinger.com/tutorials/deploy-web-apps-using-kamal?utm_campaign=Generic-Tutorials-DSA|NT:Se|LO:DE-EN&utm_medium=ppc&gad_source=1&gclid=Cj0KCQiAwtu9BhC8ARIsAI9JHanI6t3STaaEKPOoPX5VlPsGYTikzfTNA7wJrYNcVcJhOS-mO_c9gp8aApU8EALw_wcB#Why_Use_Kamal_for_Web_App_Deployment
