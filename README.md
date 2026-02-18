# Ninjap 🥷

**Promote someone to Ninja. Instantly.**

Ninjap is a lightweight Ruby gem that generates beautiful PNG certificates to officially promote someone to Ninja status.

It can be used:

- From the command line
- Inside Ruby applications
- As part of web services (like https://smokyusmaximus.com)

---

## ✨ Features

- Generate PNG certificate files
- Clean CLI interface
- Lightweight (MiniMagick based)
- No heavy dependencies
- Perfect for fun promotions, internal awards, or creative projects

---

## 📦 Installation

Add this line to your application's Gemfile:

```ruby
gem 'ninjap'
```

Then run:

```
bundle install
```

Or install directly:

```
gem install ninjap
```

---

## 🚀 Usage

### Command Line

Promote someone directly from terminal:

```
ninjap -p "Great Person" "Your Name" output.png
```

If no output file is provided, it will attempt to write into the current directory.

Example:

```
ninjap -p "John Doe" "Gojko" /tmp/john_ninja.png
```

---

### Ruby Usage

You can also use it inside Ruby code:

```ruby
system("ninjap", "-p", "John Doe", "Gojko", "john.png")
```

---

## 🛠 Development

Clone the repository:

```
git clone https://github.com/gojkogit2/ninjap.git
cd ninjap
```

Install dependencies:

```
bundle install
```

Run tests:

```
rake spec
```

Build the gem locally:

```
gem build ninjap.gemspec
```

---

## 📤 Releasing

1. Update version in `lib/ninjap/version.rb`
2. Commit changes
3. Tag the release:

```
git tag vX.Y.Z
git push origin main --tags
```

4. Build and push to RubyGems:

```
gem build ninjap.gemspec
gem push ninjap-X.Y.Z.gem
```

---

## 🤝 Contributing

Pull requests are welcome.

For major changes, please open an issue first to discuss what you would like to change.

---

## 📄 License

MIT License

---

## 💬 Project

Live example using this gem:

👉 https://smokyusmaximus.com/

Promote wisely. 🥷