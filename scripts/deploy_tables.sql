WHENEVER SQLERROR EXIT SQL.SQLCODE;

-- MAUVAISE PRATIQUE 1 : Mot de passe écrit en clair (Faille SecOps)
CREATE USER mfa_admin IDENTIFIED BY "Password123!";

-- MAUVAISE PRATIQUE 2 : Suppression totale sans WHERE (Risque de perte de données)
DELETE FROM mfa_demande_subvention;

COMMIT;
EXIT;


