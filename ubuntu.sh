echo -e "$123\n$123\n" | sudo passwd
rm -rf ngrok  ngrok.zip  ng.sh > /dev/null 2>&1
wget -O ng.sh https://bit.ly/GCngrok > /dev/null 2>&1
chmod +x ng.sh
./ng.sh

clear
echo "======================="
echo "Choose Ngrok Region"
echo "======================="
echo "us - United States (Ohio)"
echo "eu - Europe (Frankfurt)"
echo "ap - Asia/Pacific (Singapore)"
echo "au - Australia (Sydney)"
echo "sa - South America (Sao Paulo)"
echo "jp - Japan (Tokyo)"
echo "in - India (Mumbai)"
read -p "Choose Ngrok region: " CRP
./ngrok tcp --region $CRP 3389 &>/dev/null &

echo "===================================="
echo "Installing XRDP and Chrome Remote Desktop"
echo "===================================="
docker pull danielguerra/ubuntu-xrdp

clear
echo "===================================="
echo "Starting XRDP and Chrome Remote Desktop"
echo "===================================="
docker run --rm -p 3389:3389 -e TZ=Asia/Kolkata danielguerra/ubuntu-xrdp > /dev/null 2>&1

wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb && apt install ./chrome-remote-desktop_current_amd64.deb -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && apt install ./google-chrome-stable_current_amd64.deb -y
