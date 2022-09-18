return {
    type = "table",
    entries = {
        polynomial = {
            type = "table",
            keys = {
                type = "number",
				int = true,
				range = { min = 1 }
            },
            values = {
                type = "number"
            },
			default = {0.2, 0.5, 1},
			description = "A polynomial definining the dashing intensity. List of coefficients starting with the one for `x^0`."
        },
        effects = {
            type = "table",
			entries = {
				speed = {
					type = "number",
					range = {min = -10, max = 10},
					default = 2,
					description = "Multiplicative speed modifier"
				},
				jump = {
					type = "number",
					range = {min = -10, max = 10},
					default = 0.5,
					description = "Additive jump modifier"
				},
				gravity = {
					type = "number",
					range = {min = -10, max = 10},
					default = -0.1,
					description = "Additive gravity modifier"
				}
			}
        },
        dashing = {
            type = "number",
            range = {min = 0, max = 10},
			default = 1,
			description = "Time it takes to dash in seconds."
        },
        charging = {
            type = "number",
            range = {min = 0, max = 10},
			default = 3,
			description = "Time it takes to charge a dash in seconds."
        },
        particles = {
            type = "number",
            range = {min = 0, max = 100},
			default = 5,
			description = "Maximum of node particles to be spawned when somebody is dashing. Set to zero for no particles."
        },
        hold = {
            type = "boolean",
			default = true,
			description = "Whether to hold or press the special key."
        }
    }
}