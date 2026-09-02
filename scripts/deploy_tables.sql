-- Configuration de la gestion des erreurs SQLcl
WHENEVER SQLERROR EXIT SQL.SQLCODE;

REM ====================================================================
REM PROJET      : Module de gestion des demandes - Ministère de la Famille
REM DESCRIPTION : Nettoyage conditionnel et insertion de test
REM ARCHITECTE  : Paul
REM ====================================================================

-- 1. Suppression ciblée et sécurisée avec clause WHERE
-- On utilise un identifiant précis pour éviter la perte massive de données
DELETE FROM mfa_demande_subvention 
WHERE nom_demandeur = 'Famille Tremblay';

-- 2. Insertion de validation
INSERT INTO mfa_demande_subvention (nom_demandeur, montant_accorde) 
VALUES ('Famille Tremblay', 1500.00);

COMMIT;
EXIT;


