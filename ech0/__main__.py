from pathlib import Path

# Range to generate
START_KEY: int = 224
END_KEY: int = 255

TEMPLATE: str = """\
Filetype: Flipper SubGhz Key File
Version: 1
Frequency: 302757000
Preset: FuriHalSubGhzPresetOok650Async
Protocol: Holtek_HT12X
Bit: 12
Key: 00 00 00 00 00 00 04 {KEY}
TE: 333"""  # Sub-GHz script template
OUTPUT: Path = Path(__file__).parent.parent.joinpath("subghz/!SLCIT")  # Output path
KEYS: dict = {
    "3_Fan_High": 223,
    "2_Fan_Medium": 239,
    "1_Fan_Low": 247,
    "0_Fan_Off": 253,
    "Light_Toggle": 254
}  # Known keys


def main() -> None:
    generate_fan_reverse_scripts()  # Fan reverse ended up being 251 (FB)


def generate_fan_reverse_scripts() -> None:
    """Generate all scripts, from 224 (E0) to 255 (FF), skipping known keys, to
    try and find the missing fan reverse button."""
    
    key: int
    value: str

    for key in range(START_KEY, END_KEY + 1):  # Loop from lowest to highest known keys
        if key not in [value for value in KEYS.values()]:  # Skip already known keys
            value = hex(key)[2:].upper()  # Extract hexadecimal value
            open(OUTPUT.joinpath(f"Fan_Reverse_{value}.sub"), "w").write(TEMPLATE.replace("{KEY}", value))  # Write Sub-GHz script

if __name__ == "__main__":
    main()
