CREATE TABLE age_key (
    age INTEGER,
    age_text VARCHAR,
    PRIMARY KEY (age)
);

CREATE TABLE asthma_key (
    asthma INTEGER,
    asthma_text VARCHAR,
    PRIMARY KEY (asthma)
);

CREATE TABLE diabetic_key (
    diabetic INTEGER,
    diabetic_text VARCHAR,
    PRIMARY KEY (diabetic)
);

CREATE TABLE drinking_alcohol_key (
    drinking_alcohol INTEGER,
    drinking_alcohol_text VARCHAR,
    PRIMARY KEY (drinking_alcohol)
);

CREATE TABLE health_key (
    general_health INTEGER,
    general_health_text VARCHAR,
    PRIMARY KEY (general_health)
);

CREATE TABLE heart_disease_key (
    heart_disease INTEGER,
    heart_disease_text VARCHAR,
    PRIMARY KEY (heart_disease)
);

CREATE TABLE kidney_key (
    kidney_disease INTEGER,
    kidney_text VARCHAR,
    PRIMARY KEY (kidney_disease)
);

CREATE TABLE physical_key (
    physically_active INTEGER,
    physically_active_text VARCHAR,
    PRIMARY KEY (physically_active)
);

CREATE TABLE race_key (
    race INTEGER,
    race_text VARCHAR,
    PRIMARY KEY (race)
);

CREATE TABLE sex_key (
    sex INTEGER,
    sex_text VARCHAR,
    PRIMARY KEY (sex)
);

CREATE TABLE skin_cancer_key (
    skin_cancer INTEGER,
    skin_cancer_text VARCHAR,
    PRIMARY KEY (skin_cancer)
);

CREATE TABLE smoking_key (
    smoking INTEGER,
    smoking_text VARCHAR,
    PRIMARY KEY (smoking)
);

CREATE TABLE strokes_key (
    strokes INTEGER,
    strokes_text VARCHAR,
    PRIMARY KEY (strokes)
);

CREATE TABLE walking_key (
    difficulty_walking INTEGER,
    difficulty_walking_text VARCHAR,
    PRIMARY KEY (difficulty_walking)
);

CREATE TABLE heart_indicators (
    PatientID INTEGER,
	HeartDisease INTEGER REFERENCES heart_disease_key(heart_disease),
    BMI DECIMAL,
	Smoking INTEGER REFERENCES smoking_key(smoking),
	AlcoholDrinking INTEGER REFERENCES drinking_alcohol_key(drinking_alcohol),
	Stroke INTEGER REFERENCES strokes_key(strokes),
	PhysicalHealth INTEGER, 
	MentalHealth INTEGER,
	DiffWalking INTEGER REFERENCES walking_key(difficulty_walking),
	Sex INTEGER REFERENCES sex_key(sex),
	AgeCategory INTEGER REFERENCES age_key(age),
	Race INTEGER REFERENCES race_key(race),
	Diabetic INTEGER REFERENCES diabetic_key(diabetic),
	PhysicalActivity INTEGER REFERENCES physical_key(physically_active),
	GenHealth INTEGER REFERENCES health_key(general_health),
	Sleeptime INTEGER,
	Asthma INTEGER REFERENCES asthma_key(asthma),
	KidneyDisease INTEGER REFERENCES kidney_key(kidney_disease),
	SkinCancer INTEGER REFERENCES skin_cancer_key(skin_cancer),
    PRIMARY KEY (PatientID)
);

SELECT * FROM heart_indicators