#!/usr/bin/env python3.7

import iterm2
# This script was created with the "basic" environment which does not support adding dependencies
# with pip.

ICON2X = "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"

ICON = "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"

async def main(connection):
    icon = iterm2.StatusBarComponent.Icon(1, ICON)
    icon2x = iterm2.StatusBarComponent.Icon(2, ICON2X)

    component = iterm2.StatusBarComponent(
        short_description="VTEX Repository",
        detailed_description="Displays name of VTEX repository",
        knobs=[],
        exemplar="store-components",
        update_cadence=None,
        identifier="com.iterm2.example.vtex-repo",
        icons=[icon, icon2x])

    @iterm2.StatusBarRPC
    async def vtexRepo(knobs, path=iterm2.Reference("path?")):
        if not path:
            return ''
        structure = path.split('/')

        if not 'vtex' in structure:
            return ''

        pos = structure.index('vtex')
        if pos == len(structure) - 1:
            return ''

        return structure[pos + 1]

    await component.async_register(connection, vtexRepo)

iterm2.run_forever(main)
