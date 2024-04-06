-- Table for Challenge Participants
CREATE TABLE homebase.ChallengeParticipants (
    participant_id SERIAL PRIMARY KEY,
    challenge_id INT,
    user_id INT,
    CONSTRAINT fk_challenge_participant
        FOREIGN KEY (challenge_id)
        REFERENCES homebase.UserChallenges(challenge_id),
    CONSTRAINT fk_participant_user
        FOREIGN KEY (user_id)
        REFERENCES homebase.users(user_id)
);