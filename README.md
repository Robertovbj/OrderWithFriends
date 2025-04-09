# Order With Friends

_Order With Friends_ is an open-source platform designed to simplify collaborative ordering and group purchases. Whether you're organizing lunch for your office, a pizza night with friends, or bulk purchases for your community, _Order With Friends_ streamlines the entire process from collection to payment.

## 🌟 Features

### User & Group Management
- Create personal profiles and connect with friends
- Form groups with customizable roles and permissions
- Public or private group options with invitation system

### Order Management
- Create orders with deadlines and delivery estimates
- Customize available products and pricing
- Set order minimums and maximums for group purchases
- Share order links with customizable permissions

### Payment Tracking
- Multiple cost-splitting options (equal, proportional, custom)
- Track who has paid and who hasn't
- Support for covering others' payments with payback tracking
- Multiple payment method tracking

### Product Customization
- Support for product variations and add-ons
- User-specific customizations with pricing adjustments
- Group-specific product catalogs

### Notifications & History
- Automated notifications for order status changes
- Payment reminders and updates
- Comprehensive order history and audit trail

## 🚀 Getting Started

### Prerequisites

- Ruby (version 3.0.0 or newer)
- Rails (version 7.0.0 or newer)
- PostgreSQL (version 13 or newer)
- Node.js and Yarn for asset compilation
- Git

### Installation

1. **Fork and clone the repository**
   ```bash
   git clone https://github.com/YOUR-USERNAME/OrderWithFriends.git
   cd OrderWithFriends
   ```

2. **Install dependencies**
   ```bash
   bundle install
   yarn install
   ```

3. **Set up the database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed  # Loads sample data
   ```

4. **Set up environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your local configuration
   ```

5. **Start the server**
   ```bash
   rails server
   ```

6. **Visit the application**
   Open your browser and navigate to `http://localhost:3000`

## 🛠️ Tech Stack

- **Backend**: Ruby on Rails
- **Database**: PostgreSQL
- **Frontend**: Bootstrap
- **Future Plans**: PWA support, possible Flutter mobile app

## 🤝 Contributing

We welcome contributions from the community! Whether it's bug fixes, feature additions, or documentation improvements, your help is appreciated.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

Please read our [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## 🔄 Use Cases

- **Office Lunch Coordination**: Organize daily lunch orders for your team
- **Group Food Delivery**: Split the cost of delivery fees and manage complex restaurant orders
- **Event Catering**: Plan large orders with customizations for events
- **Recurring Orders**: Set up regular group purchase arrangements
- **Community Bulk Buying**: Coordinate bulk purchases to save on costs

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact

[Roberto Barbosa] - roberto.rvbj@gmail.com

Project Link: [https://github.com/Robertovbj/OrderWithFriends](https://github.com/Robertovbj/OrderWithFriends)

## Support the Project

If you find this tool helpful, you can support its development by buying me a coffee:

[![Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://Ko-fi.com/robertorvbj)
