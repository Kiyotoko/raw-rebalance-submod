#!/usr/bin/env python3

import os

folder_exceptions = ["AI", "Campaigns", "Enum", "Hardpoints", "Story", "SFX"]
file_exceptions = [
    "Animationsfxmaps.txt",
    "Blackmarketitems.xml",
    "CampaignFiles.xml",
    "CommandBarComponent",
    "DifficultyAdjustments.xml",
    "Dynamictrackfx.xml",
    "Expansion_factions.xml",
    "FactionFiles.xml",
    "Factions.xml",
    "GroundUnitTargetingPriorities.xml",
    "GameConstants.xml",
    "GameObjectFiles.xml",
    "Guidialogs.xml",
    "HardpointDataFiles.xml",
    "HeroClash.xml",
    "Lightningeffecttypes.xml",
    "Lightsources.xml",
    "Movies.xml",
    "Musicevents.xml",
    "SfxEventFiles.xml",
    "Surfacefx.xml",
    "SpaceUnitTargetingPriorities.xml",
    "Speechevents.xml",
    "Tacticalcameras.xml",
    "TargetingPrioritysetFiles.xml",
    "Terraindecalfx.xml",
    "TradeRouteFiles.xml",
    "TradeRouteLines.xml",
    "TradeRoutes.xml",
    "TurretTargetingPriorities.xml",
    "UnitHeroGeneric.xml",
    "RaW_Story_Plots_Empire_Kamino.xml",
    "Radarmap.xml",
    "SpaceUnitTargetingPriorities",
    "WeatherAudio.xml",
    "Weatherscenarios.xml"
]

def walk_folder(root_folder):
    for dirpath, _, filenames in os.walk(root_folder):
        list_folder(root_folder, dirpath, filenames)

def list_folder(root_folder, dirpath, filenames):
    for ex in folder_exceptions:
        if ex in dirpath:
            return
    print(f"\t<!-- {dirpath.replace('/', '\\')} -->")
    filenames.sort()
    for filename in filenames:
        list_file(root_folder, dirpath, filename)

def list_file(root_folder, dirpath, filename):
    for ex in file_exceptions:
        if ex in filename:
            return
    full_path = os.path.join(dirpath, filename)
    relative_path = os.path.relpath(full_path, root_folder)
    print(f"\t<File>{relative_path.replace('/', '\\')}</File>")

if __name__ == "__main__":
    print('<?xml version="1.0" encoding="utf-8"?>\n<Game_Object_Files>')
    walk_folder("Data/XML/")
    print('</Game_Object_Files>')
