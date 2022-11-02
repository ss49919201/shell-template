#!/bin/bash

# ルーティングテーブルの表示
# 宛先+Next Hop
ip route show

# Network Namespace作成
ip netns add sample

ip netns list

ip netns exec sample ip route show

ip netns delete sample

ip link add
