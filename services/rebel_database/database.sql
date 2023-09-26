-- Create the Planets table
CREATE TABLE IF NOT EXISTS Planets (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Sector VARCHAR(255),
    Terrain VARCHAR(255),
    Population BIGINT,
    Affiliation VARCHAR(255)
);

-- Create the Starships table
CREATE TABLE IF NOT EXISTS Starships (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Class VARCHAR(255),
    Hyperdrive DECIMAL(4, 2),
    Armament VARCHAR(255),
    Status VARCHAR(255)
);

-- Create the Rebel Agents table
CREATE TABLE IF NOT EXISTS Agents (
    ID SERIAL PRIMARY KEY,
    Codename VARCHAR(255) NOT NULL,
    Species VARCHAR(255),
    Rank VARCHAR(255),
    HomeworldID INT,
    YearsOfService INT,
    ContactFrequency VARCHAR(255),
    CONSTRAINT fk_homeworld FOREIGN KEY (HomeworldID) REFERENCES Planets (ID)
);

-- Create the Captain table
CREATE TABLE IF NOT EXISTS Captains (
    ID SERIAL PRIMARY KEY,
    AgentID INT,
    StarshipID INT,
    CONSTRAINT fk_agent FOREIGN KEY (AgentID) REFERENCES Agents (ID),
    CONSTRAINT fk_starship FOREIGN KEY (StarshipID) REFERENCES Starships (ID)
);

-- Create the Missions table
CREATE TABLE IF NOT EXISTS Missions (
    ID SERIAL PRIMARY KEY,
    DestinationID INT,
    CaptainID INT,
    Objective TEXT NOT NULL,
    StartDate DATE,
    EndDate DATE,
    MissionStatus VARCHAR(255),
    ReportSummary TEXT,
    CONSTRAINT fk_destination FOREIGN KEY (DestinationID) REFERENCES Planets (ID),
    CONSTRAINT fk_starship_agent FOREIGN KEY (CaptainID) REFERENCES Captains (ID)
);

-- Insert data into the Planets table
INSERT INTO Planets (ID, Name, Sector, Terrain, Population, Affiliation)
VALUES
    (1, 'Tatooine', 'Outer Rim', 'Desert', 200000, 'Neutral'),
    (2, 'Alderaan', 'Core Worlds', 'Grasslands', 2000000, 'Rebel'),
    (3, 'Hoth', 'Outer Rim', 'Ice', 0, 'Rebel'),
    (4, 'Endor', 'Outer Rim', 'Forest', 30000, 'Neutral'),
    (5, 'Coruscant', 'Core Worlds', 'Urban', 1000000000, 'Empire'),
    (6, 'Yavin 4', 'Outer Rim', 'Jungle', 1000, 'Rebel'),
    (7, 'Bespin', 'Outer Rim', 'Gas Clouds', 6000000, 'Empire'),
    (8, 'Naboo', 'Mid Rim', 'Grasslands', 4500000000, 'Empire'),
    (9, 'Jakku', 'Inner Rim', 'Desert', 50, 'Neutral'),
    (10, 'Lothal', 'Outer Rim', 'Grasslands', 1000000, 'Rebel'),
    (11, 'Ryloth', 'Outer Rim', 'Desert', 1500000, 'Empire'),
    (12, 'Mon Cala', 'Mid Rim', 'Ocean', 27500000, 'Rebel'),
    (13, 'Lasan', 'Outer Rim', 'Caves', 100000, 'Empire'),
    (14, 'Iridonia', 'Mid Rim', 'Arid', 1200000, 'Neutral'),
    (15, 'Corellia', 'Core Worlds', 'Urban', 3000000, 'Empire'),
    (16, 'Mirial', 'Outer Rim', 'Desert', 3000000, 'Neutral');

-- Insert data into the Starships table
INSERT INTO Starships (ID, Name, Class, Hyperdrive, Armament, Status)
VALUES
    (1, 'Millennium Falcon', 'YT-1300', 0.5, 'Turrets', 'Active'),
    (2, 'Tantive IV', 'CR90 Corvette', 2.0, 'Laser Cannons', 'Decommissioned'),
    (3, 'X-Wing Red 5', 'T-65 X-Wing', 1.0, 'Proton Torpedoes', 'Active'),
    (4, 'Slave I', 'Firespray-31', 1.5, 'Blaster Cannons', 'In Repair'),
    (5, 'Star Destroyer', 'Imperial-class', 2.0, 'Turbolasers', 'Active'),
    (6, 'A-Wing Green 3', 'RZ-1 A-Wing', 1.5, 'Laser Cannons', 'Active'),
    (7, 'B-Wing Dagger 9', 'Blade Wing', 2.0, 'Ion Cannons', 'In Repair'),
    (8, 'Falcon''s Pride', 'YT-1300', 0.7, 'Quad Laser Turrets', 'Active'),
    (9, 'Rogue Shadow', 'Star Courier', 1.8, 'Blaster Cannons', 'Active'),
    (10, 'Ghost II', 'Modified VCX-100', 1.5, 'Blaster Turrets', 'Active');

-- Insert data into the Rebel Agents table
INSERT INTO Agents (ID, Codename, Species, Rank, HomeworldID, YearsOfService, ContactFrequency)
VALUES
    (1, 'Rogue One', 'Human', 'Captain', 6, 5, 'High'),
    (2, 'Specter 5', 'Twi''lek', 'Lieutenant', 11, 3, 'Moderate'),
    (3, 'Pathfinder', 'Mon Calamari', 'Admiral', 12, 10, 'Low'),
    (4, 'Ghost', 'Lasat', 'Commander', 13, 2, 'High'),
    (5, 'Ace', 'Duros', 'Captain', 7, 7, 'Moderate'),
    (6, 'Havoc Six', 'Zabrak', 'Lieutenant', 14, 4, 'Moderate'),
    (7, 'Whisperer', 'Mirialan', 'Operative', 16, 2, 'High'),
    (8, 'Nomad', 'Human', 'Sergeant', 15, 6, 'Low'),
    (9, 'Specter 7', 'Duros', 'Captain', 5, 8, 'Moderate'),
    (10, 'Fulcrum', 'Clawdite', 'Commander', 8, 5, 'High');

-- Insert data into the Captains table
INSERT INTO Captains (ID, AgentID, StarshipID)
VALUES
    (1, 1, 7),
    (2, 2, 9),
    (3, 2, 8),
    (4, 3, 8),
    (5, 4, 4),
    (6, 4, 2),
    (7, 5, 5),
    (8, 6, 10),
    (9, 7, 6),
    (10, 8, 1),
    (11, 8, 10),
    (12, 9, 3),
    (13, 10, 2),
    (14, 10, 4);

-- Insert data into the Missions table
INSERT INTO Missions (ID, DestinationID, CaptainID, Objective, StartDate, EndDate, MissionStatus, ReportSummary)
VALUES
    (1, 2, 8, 'Steal Death Star plans', '2022-03-15', '2022-03-17', 'Completed', 'Obtained plans from Scarif base'),
    (2, 3, 3, 'Establish Echo Base', '2022-11-01', '2023-01-05', 'Ongoing', 'Hoth base operational, facing Empire attacks'),
    (3, 4, 5, 'Destroy Death Star II', '2023-06-10', '2023-06-12', 'Completed', 'Successful destruction near Endor'),
    (4, 1, 7, 'Infiltrate Jabba''s Palace', '2023-02-20', '2023-02-23', 'Aborted', 'Captured and imprisoned, mission compromised'),
    (5, 5, 1, 'Rescue Senator Amidala', '2023-08-15', '2023-08-17', 'Ongoing', 'Infiltrating Coruscant, facing Empire''s grip'),
    (6, 8, 4, 'Extract Naboo Diplomat', '2023-04-02', '2023-04-05', 'Completed', 'Rescued Naboo diplomat from Imperial custody'),
    (7, 6, 10, 'Smuggling Supplies to Lothal', '2023-07-20', '2023-07-23', 'Ongoing', 'Evading Imperial patrols, delivering goods'),
    (8, 7, 14, 'Infiltrate Cloud City', '2022-09-15', '2022-09-17', 'Aborted', 'Discovered by authorities, mission compromised'),
    (9, 9, 12, 'Locate Jakku Artifact', '2023-01-10', '2023-01-12', 'Completed', 'Recovered ancient artifact from desert ruins'),
    (10, 10, 2, 'Establish Lothal Rebel Cell', '2023-06-01', '2023-06-03', 'Ongoing', 'Training local recruits, expanding rebel rebel presence');
