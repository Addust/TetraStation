/obj/item/sealant
	name = "Flexi seal"
	desc = "A neat spray can that can repair torn inflatable segments, and more! Mostly non-toxic!"
	icon = 'icons/obj/inflatable.dmi'
	icon_state = "sealant"
	w_class = 1

/obj/item/book/manual/rbmk
	name = "RBMK Nuclear Reactor Operations Manual"
	icon_state ="bookEngineering2"
	author = "CogWerk Engineering Reactor Design Department"
	title = "RBMK Nuclear Reactor Operations Manual"
	dat = {"<html>
				<head>
				<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {list-style: none; margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				</style>
				</head>
				<body>
				<center>
				<b style='font-size: 12px;'>CogWerk Engineering Reactor Design Department</b>
				<h1>RBMK Nuclear Reactor Operations Manual</h1>
				</center>

				<h2>Terminology:</h2>
				<li>Neutrons per generation (K): Rate of heat gain in the reactor.</li>
				<li>Moderator: Gasses that cause special effects inside the reactor.</li>
				<li>Power: How hot your reactor is versus a meltdown (%).</li>

				<h2>Generating Power:</h2>
				<p>
					The Nuclear Reactor has two inputs: Moderator and Coolant.
					The first thing we're going to worry about is the coolant loop.
					Power is generated through a simple process:
					Uranium fuel rods are placed into the reactor which immediately starts the reaction, creating constant heat.
					Our coolant gas is pumped into the reactor, heats up to the heat of the reactor,
					and then carries said heat to a set of Turbines to generator additional power.
					After this is done, the gas finally enters a heat exchanger in space to cool down the gas for further use in the loop.
					The colder the gas you put into the loop, the faster the reactor cools down.
					Innately, it's set up so that the temperature loss from coolant intake is balanced out against the heat generated by the fuel rods,
					represented by the controllable figure called K (Neutrons per generation).
					NOTE that the coolant gas can potentially retain heat and actually heat up the reactor, so, be certain to check the thermometers on the coolant loop often!
				</p>

				<h2>Setting up the reactor:</h2>
				<li>Like other gas-based engines, the AGCNR has a lot of room for experimentation.
					But if you feel unsure, or are inexperienced, you can follow this step-by-step guide to set up the reactor safely and easily.
				</li>
				<h2>Preparing for radiation:</h2>
				<ol>
				<li>Turn on your tablet, download and run the nuclear reactor monitoring and keep the tablet on in your pocket.</li>
				<li>Put on radiation protection gear. Altough the reactor does not emit radiation until it has started working, it is better to stay safe.</li>
				</ol>
				<h2>Setting Up:</h2>
				<ol>
				<li>First, familiarize yourself with the pumps going in and out of the reactor, notice their labels and how they are connected throughout the room.</li>
				<li>Second, setup the coolant loop (cyan pipes). Wrench N2 and the N20 cannisters into their docks in the reactor room and the turbine room</li>
				<li>Turn on the four turbines then make your way to Atmos</li>
				<li>In Atmos, turn on Plasma and Oxygen (all pumps and mixers should be 4500 kPa) to the yellow pipes leading to the orange and set the mixer to 80% for main and then turn on the Mix to Engine pump to send the moderator gas to the reactor (Should be around the mixer and plasma pump)</li>
				<li>Now we return to the reactor, and pickup the fuel rods from the pools and place 3 of them into the reactor.</li>
				<li>The reactor is on, but the pumps need turned on, you can do it manual from the reactor room or head into the reactor control room and use the first three computers.</li>
				<li>There are three old computers labeled input, moderator, output. You can click these and the pumps in the room will turn on to the reactor.</li>
				<li>Alt-Click these computers to set there pump rate: Input = 500 kPa, Moderator = 4500 kPa, and Output = 4500 kPa.</li>
				<li>Notice changes to your tablet Reactor Monitoring Program or even look at the Reactor Monitor further in the room </li>
				<li>Next you will notice the reactor is not heating up much, this is where the Control Rod Management computer comes in.</li>
				<li>With the Control Rod Computer opened, raise the Target Critically bar to 3 to heat up the reactor.</li>
				<li>While you wait for the reactor to heat up, go a head and setup the Power Storage Units to Max Target Input and about 150 Target Output for each of them.</li>
				<li>Head back to the Control Rod Computer when the power is at 60% and go a head and lower the Target Critically to 1. Note: You might have to tweak it a little to say 1.1 or 0.8 as reactors have varying critical targets.</li>
				<li>It is done! The reactor should stay stable until the control rods are depleted.</li>
				</ol>

				<h2>Coolant Gases:</h2>
				<li>You have quite a few options on coolants, mainly N20 is used by default.</li>
				<li>CO2 is an extremely safe coolant, but it's not hugely effective. It cannot catch fire which is a definite bonus.</li>
				<li>Plasma is an exceptional coolant as it can absorb a lot of heat. However, it is easily sabotaged.</li>
				<li>Oxygen is a somewhat safer alternative than plasma, however it can still be sabotaged if you add plasma to the loop to cause a pipe fire.</li>
				<li>N2O is a good balance between Plasma and Oxygen.</li>

				<h2>MODERATOR TYPES:</h2>
				<h2>Fuel Gases:</h2>
				<li>Oxygen: Power production multiplier. Allows you to run a low plasma, high oxy mix, and still get a lot of power.</li>
				<li>Plasma: Power production gas. More plasma -> more power, but it enriches your fuel and makes the reactor much, much harder to control.</li>
				<li>Tritium: Extremely efficient power production gas. Will cause chernobyl if used improperly.</li>

				<h2>Moderating Gases:</h2>
				<li>N2: Helps you regain control of the reaction by increasing control rod effectiveness, will massively boost the radiation production of the reactor. </li>
				<li>CO2: Super effective shutdown gas for runaway reactions but produces a massive amount of radiation! </li>
				<li>Pluoxium: Same as N2, but without an increased radiation production.</li>

				<h2>Permeability Type Gases(Coolant Speed):</h2>
				<li>BZ: Increases your reactor's ability to transfer its heat to the coolant, thus letting you cool it down faster (but the coolant exiting will be much hotter).</li>
				<li>Water Vapour: More efficient permeability modifier.</li>
				<li>Hyper Noblium: Extremely efficient permeability increase.(10x as efficient as bz).</li>

				<h2>MAINTENANCE:</h2>
				<p>
				So you've started the reactor up, but your job isn't done yet. ever.
				You've still got to prepare to shut the reactor down, change the rods, and make sure it doesn't blow up halfway!
				The higher the K the more power and heat you produce, at 1k it should be stable, but if it's not, adjust the decimal points.
				</p>
				<h2>Preparing to shutdown the reactor:</h2>
				<p>
				First, you have to prepare your shutoff mix, to do this, run over to atmos and fill yourself two cans of co2, do this by turning on the co2 output to mixline, and mix line to the connector.
				Then, remember to setup atmos if they haven't already and make sure the moderator is being made (follow the orange line).
				Now, you should run your cans back over to engineering and place them in the reactor chamber for when you need them.
				</p>
				<h2>Shutting down the reactor:</h2>
				<p>
				Once your timer to change the rods is up, go ahead and turn the reactor rod control to 0 K,
				this will cause the reactions in the reactor to stop, and slowly settle down, while this is happening,
				you want to insert the CO2 cans you prepared into the direct moderator input, and set the moderator to 1000-1500 kPa,
				this will ration out your 9000 kPa odd co2 for shutdown.
				Once the reactor power is under 20 percent, you are then able to remove the fuel rods.
				This will shut the reactor down for good, now you want to unwrench your co2 cans, refill them and bring them back again.
				You are now good to insert new rods into the reactor and start it up again.
				NOTE: Please keep spent rods away from normal rods, remember to reset the moderator input amount.
				</p>
				<h2>Repairing the reactor:</h2>
				<p>
				If your reactor gets damaged, either from the pressure or heat, you can repair it with a welding tool and flexi seal,
				this will repair the seals and make sure you don't blow up next time you start it up.
				</p>

				<h2>Fuel Rods:</h2>
				<p>
				Fuel rods are what start the nuclear reaction in your reactor.
				They are - usually - made of uranium, which releases Neutrons.
				These neutrons then hit other uranium atoms, causing more Neutrons to break free,
				repeating the cycle as long as you have uranium in the fuel rods.
				many Neutrons one are created when one atom is hit by a Neutron is shown by the value of Neutrons per generatrion or simply K.
				As a side effect of this reaction, an extreme amount of heat is produced, which is then used to generate power.
				One type of fuel rods are the material rods.
				They are rods which, when material is inserted into them, and they are in a Reactor, reacting with Neutrons, create more of that material.
				Once the rod depletes, you can harvest the ores from the rod. Be warned, however, that when the rod depletes,
				it will become much more powerful, making the reactor harder to control. Of course, it is not as easy as mounting the rods on your reactor then forgetting about them.
				There are actually a multitude of fuel rods that you might come across:

				<li><b>Uranium-238 rod:</b> The standard fuel rod, for standard people.</li>
				<li><b>Plutonium-239 rod:</b> This is what happens when the Uranium on fuel rods gets used up in the reactions in a Reactor.
				These rods are much more radioactive, and can generate much more power. .</li>
				<li><b>Depleted fuel rod:</b> This is created when a Plutonium fuel rod loses all of the useful Plutonium on it. Highly radioactive, but very weak.</li>
				<li><b>Bananium fuel rod:</b> Made with that space clown magic.
				A special material rod variant that "grows" bananium ore when it is reacting with Neutrons in a Reactor.
				Noticably radioactive and extremely hillarious. </li>

				</body>
				</html>
			"}
