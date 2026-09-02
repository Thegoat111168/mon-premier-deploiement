WHENEVER SQLERROR EXIT SQL.SQLCODE;

REM ====================================================================
REM PROJET      : Module de gestion des demandes - Ministère de la Famille
REM DESCRIPTION : Déploiement sécurisé, indexé et transactionnel
REM ARCHITECTE  : Paul (Validé par Linter IA)
REM ====================================================================

-- 1. OPTIMISATION PERFORMANCE : Création de l'index recommandé par l'IA
-- Permet d'accélérer les clauses WHERE sur le nom du demandeur
CREATE INDEX idx_mfa_nom_demandeur ON mfa_demande_subvention (nom_demandeur);

-- 2. SECURITE & ARCHITECTURE : Bloc PL/SQL complet avec variables liées
DECLARE
    -- Utilisation de variables pour bloquer les injections SQL
    v_demandeur mfa_demande_subvention.nom_demandeur%TYPE := 'Famille Tremblay';
    v_montant   mfa_demande_subvention.montant_accorde%TYPE := 1500.00;
BEGIN
    -- Suppression sécurisée par variable liée
    DELETE FROM mfa_demande_subvention 
    WHERE nom_demandeur = v_demandeur;

    -- Insertion sécurisée par variable liée
    INSERT INTO mfa_demande_subvention (nom_demandeur, montant_accorde) 
    VALUES (v_demandeur, v_montant);

    -- Gestion stricte de la transaction
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20001, 'Erreur lors du traitement DevOps : ' || SQLERRM);
END;
/
EXIT;



