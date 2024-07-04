#!/bin/bash

# Backup the priv_validator_state.json file
cp $HOME/.0gchain/data/priv_validator_state.json $HOME/.0gchain/priv_validator_state.json.backup

# Reset the 0gchain data safely while keeping the address book
0gchaind tendermint unsafe-reset-all --home $HOME/.0gchain --keep-addr-book

# Download the latest snapshot and extract it to the .0gchain directory
curl -L https://snapshot.nodecattel.xyz/0gchain/zgtendermint_16600-2_latest.tar.lz4 | sudo lz4 -dc - | sudo tar -xf - -C $HOME/.0gchain

# Restore the backup of the priv_validator_state.json file
mv $HOME/.0gchain/priv_validator_state.json.backup $HOME/.0gchain/data/priv_validator_state.json
