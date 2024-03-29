/* This can be used as a teplate for your sql statements if you need to wrap it in a trancasaction */

BEGIN TRANSACTION
BEGIN TRY

	/* Do stuff here... */

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    DECLARE @ErrorNumber INT;
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT @ErrorNumber = ERROR_NUMBER(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();

    ROLLBACK TRANSACTION

    RAISERROR (@ErrorNumber, @ErrorSeverity, @ErrorState);
END CATCH;
