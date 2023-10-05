# 🪣 Bucket

Dive into a bucket full of media magic, orchestrated neatly with Docker. Whether you're a movie buff, series binge-watcher, or a torrent aficionado, there's something in the bucket for you!

## 🎬 What's Inside The Bucket?

- **Jellyfin:** Your very own Personal Media Server.
- **Sonarr:** TV Series management.
- **Radarr:** Movie collection manager.
- **Prowlarr:** Indexer manager.
- **qBittorrent:** Torrent downloader.
- **FileBrowser:** Web File Browser.
- And a dash of other utilities to glue it all together!

## 🎨 Customization

Tweak the `docker-compose.yml` to your heart's content. Be sure to check out the individual service docs for more on configuration:

- [Jellyfin](https://jellyfin.org/docs/general/administration/hardware-acceleration/amd)
- [Sonarr](https://github.com/hotio/sonarr)
- [Radarr](https://github.com/hotio/radarr)
- [Prowlarr](https://github.com/hotio/prowlarr)
- [qBittorrent](https://hub.docker.com/r/linuxserver/qbittorrent)
- [FileBrowser](https://hub.docker.com/r/filebrowser/filebrowser)

## 🐳 Docker Compose

The `docker-compose.yml` includes all the services you need to get your media stack up and running. From Jellyfin to qBittorrent, it's all here and ready to go!

Thank you for pointing that out. I've identified the environment variables from the `docker-compose.yml` file, and included them in the revised 🚀 Quick Start section below:

## 🚀 Quick Start

1. **Clone The Repo:**
   ```bash
   git clone https://github.com/default-anton/bucket.git
   cd bucket
   ```

2. **Set Up Environment Variables:**
   Utilize `direnv` to set up the necessary environment variables. Create a `.envrc` file in the root of the project with your settings:
   ```bash
   echo 'export ROOT_DIR="/path/to/bucket"' > .envrc
   echo 'export SSH_USER="your-username"' >> .envrc
   echo 'export SSH_HOST="your-host"' >> .envrc
   echo 'export SSH_PORT="your-port"' >> .envrc
   echo 'export TZ="America/Vancouver"' >> .envrc
   echo 'export WIREGUARD_ADDRESSES="your-wireguard-addresses"' >> .envrc
   echo 'export WIREGUARD_PRIVATE_KEY="your-wireguard-private-key"' >> .envrc
   echo 'export SERVER_COUNTRIES="your-server-countries"' >> .envrc
   echo 'export OWNED_ONLY="your-owned-only-setting"' >> .envrc
   direnv allow
   ```

3. **Deploy Bucket:**
   Run the following command to deploy and orchestrate Bucket:
   ```bash
   make
   ```

Your media magic will now be orchestrated and deployed ready for your enjoyment! 🍿

## 💪 Contribute

Feel the bucket lacks something? Fork it, add your magic, and submit a PR. Let's make this bucket bottomless!

## 📜 License

MIT License. See `LICENSE` for more information.
