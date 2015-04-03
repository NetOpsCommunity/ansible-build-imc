#!/usr/bin/expect

set timeout 900

spawn /root/install/installsilence.sh

expect {
  timeout { send_user "\nInstall script failed to complete before timeout\n"; exit 1 }
  "*launch DMA." { send "\04" }
}
