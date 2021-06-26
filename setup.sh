#Dell repo
sudo sh -c 'cat > /etc/apt/sources.list.d/focal-dell.list << EOF
deb http://dell.archive.canonical.com/updates/ focal-dell public
# deb-src http://dell.archive.canonical.com/updates/ focal-dell public

deb http://dell.archive.canonical.com/updates/ focal-oem public
# deb-src http://dell.archive.canonical.com/updates/ focal-oem public

deb http://dell.archive.canonical.com/updates/ focal-somerville public
# deb-src http://dell.archive.canonical.com/updates/ focal-somerville public

deb http://dell.archive.canonical.com/updates/ focal-somerville-melisa public
# deb-src http://dell.archive.canonical.com/updates focal-somerville-melisa public
EOF'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F9FDA6BED73CDC22
sudo apt update -qq

sudo apt install oem-somerville-melisa-meta libfprint-2-tod1-goodix oem-somerville-meta tlp-config -y
sudo apt update -qq

#GRUB theme
wget -O - https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh | bash

#Plasma
sudo apt install kde-plasma-desktop

#Albert
curl "https://build.opensuse.org/projects/home:manuelschneid3r/public_key" | sudo apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
sudo apt update
sudo apt-get install albert

#pfetch
git clone https://github.com/dylanaraps/pfetch

#Config files
sudo cp ./pfetch/pfetch /usr/local/bin/
cp -r ./chrome ~/.mozilla/firefox/
cp -r ./Color-Scripts/ ./.fonts/ ~/
cp -r ./albert ~/.config/
cp ./.bash-powerline.sh ./.bashrc ./.vimrc ./.weather.sh ~/

#Plugins

	#kwin-tiling
git clone https://github.com/kwin-scripts/kwin-tiling.git
cd kwin-tiling/
plasmapkg2 --type kwinscript -i .
kcmshell5 kwinscripts
mkdir -p ~/.local/share/kservices5
ln -s ~/.local/share/kwin/scripts/kwin-script-tiling/metadata.desktop ~/.local/share/kservices5/kwin-script-tiling.desktop
cd ..

	#Albert plugins
git clone https://github.com/bergercookie/awesome-albert-plugins
mv ./awesome-albert-plugins ~/.local/share/albert/org.albert.extension.python/modules/

	#icons
git clone https://github.com/bikass/kora
mv ./kora/* ~/.local/share/icons/
sudo rm -rf ./kora

git clone https://github.com/vinceliuice/Layan-cursors
cd ./Layan-cursors
./install.sh
cd ..
sudo rm -rf ./Layan-cursors

	#Kvantum
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install qt5-style-kvantum qt5-style-kvantum-themes
tar -xvf ./Nordic.tar.xz

#wallpapers
cp -r ./wallpapers/ ~/Pictures/

#fingerprint config
echo auth [success=1 default=ignore] pam_unix.so nullok_secure | sudo tee /etc/pam.d/common-auth
echo auth            sufficient      pam_unix.so try_first_pass likeauth nullok | sudo tee /etc/pam.d/sddm
echo auth sufficient pam_fingerprintd.so | sudo tee /etc/pam.d/sddm
sudo pam-auth-update
