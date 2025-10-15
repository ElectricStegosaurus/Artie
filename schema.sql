------------------------------------------------------------
-- enums

drop table if exists Format;
create table Format (
       id integer primary key,
       name varchar(100) unique
);
insert into Format values (0, "undefined");
insert into Format values (1, "image overlay");
insert into Format values (2, "verbal mention");
insert into Format values (3, "product use");

drop table if exists Currency;
create table Currency (
       id integer primary key,
       name varchar(100) unique
);
insert into Currency values (0, "undefined");
insert into Currency values (1, "USD");
insert into Currency values (2, "GBP");
insert into Currency values (4, "EUR");
insert into Currency values (5, "AUD");

drop table if exists Country;
create table Country (
       id integer primary key,
       name varchar(100) unique
);
insert into Country values (0, "undefined");
insert into Country values (1, "US");
insert into Country values (2, "UK");
insert into Country values (3, "Canada");
insert into Country values (4, "France");
insert into Country values (5, "Australia");

drop table if exists Vertical;
create table Vertical (
       id integer primary key,
       name varchar(100) unique
);
insert into Vertical values (0, "undefined");
insert into Vertical values (1, "Retail");
insert into Vertical values (2, "Apparel");
insert into Vertical values (3, "Health & Beauty");
insert into Vertical values (4, "CPG");
insert into Vertical values (10, "Auto");
insert into Vertical values (20, "Finance");
insert into Vertical values (30, "Healthcare");
insert into Vertical values (40, "Travel");
insert into Vertical values (50, "Media & Entertainment");
insert into Vertical values (60, "Tech");
insert into Vertical values (70, "Food & Beverage");

------------------------------------------------------------
-- advertiser side

drop table if exists Sponsor;
create table Sponsor (
       id integer primary key,
       name varchar(100),

       primary_vertical integer,
       foreign key (primary_vertical) references Vertical(id)
);

drop table if exists Sponsorship;
create table Sponsorship (
       id integer primary key,

       sponsor integer,
       format integer,
       launch_date date,
       country integer,

       vertical integer,
       product_url varchar(200),  -- a link to amazon or similar for where to buy this product

       total_budget integer,      -- the sponsor-supplied total budget for the project
       remaining_budget integer,  -- computed budget remaining after existing deals.  TODO should we just compute this?
       currency integer, 
       
       
       foreign key (sponsor) references Sponsor(id)
       foreign key (format) references Format(id)
       foreign key (currency) references Currency(id),
       foreign key (country) references Country(id),
       foreign key (vertical) references Vertical(id)
);

------------------------------------------------------------
-- creator side

drop table if exists Creator;
create table Creator (
       id integer primary key,

       name varchar(100),
       num_subscribers integer
       -- TODO: include a breakdown by region
);

-- TODO: do we need a "channel" concept?
-- TODO: bundles of creators

drop table if exists Episode;
create table Episode (
       id integer primary key,

       owner integer,
       name varchar(100),
       launch_date date,

       script_url varchar(200), -- when you upload the script, we'll suggest some vertical and format opportunities

       -- TODO: is 30 days the right time scale?  really we should split this out to its own table
       num_estimated_viewers_30d integer,
       num_actual_viewers_30d integer,

       foreign key (owner) references Creator(id)
);

drop table if exists AvailableFormats;
create table AvailableFormats (
       id integer primary key,

       episode integer,
       format integer,

       foreign key (episode) references Episode(id),
       foreign key (format) references Format(id)
);

------------------------------------------------------------
-- creator-sponsor links

drop table if exists Deals;
create table Deals (
       id integer primary key,
       sponsor integer,
       episode integer,

       -- when the deal is created, there's both a cpm and a total
       -- budget; the sponsor pays the lower of the two
       cost_cpm integer,
       cost_cap integer,
       currency integer,
       
       foreign key (sponsor) references Sponsor(id),
       foreign key (episode) references Episode(id)
       foreign key (currency) references Currency(id)
);
