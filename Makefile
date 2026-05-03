# REPO is the absolute path to this Makefile's directory.
# $(CURDIR) is set by make to the directory passed via -C (or cwd if run directly),
# so this works whether invoked as 'make' or 'make -C /path/to/wisdom'.
REPO      := $(CURDIR)
CRON_SCHED = 0 23 * * *
CRON_CMD   = make -C $(REPO) commit_quotes

.PHONY: setup-hooks commit_quotes timestamp_quotes install install_quotes install_crontab show_crontab

setup-hooks:
	pre-commit install



commit_quotes: timestamp_quotes
	bin/commit-quotes

timestamp_quotes:
	bin/timestamp-quotes quotes.txt

install: install_quotes

install_quotes:
	@TARGET="$(REPO)/quotes.txt"; \
	LINK="$(HOME)/quotes.txt"; \
	if [ -L "$$LINK" ]; then \
	    CURRENT=$$(readlink "$$LINK"); \
	    if [ "$$CURRENT" = "$$TARGET" ]; then \
	        echo "install_quotes: verified $$LINK -> $$TARGET"; \
	    else \
	        echo "WARNING: $$LINK exists but points to $$CURRENT (expected $$TARGET)"; \
	    fi; \
	elif [ -e "$$LINK" ]; then \
	    echo "WARNING: $$LINK exists and is not a symlink — leaving it alone"; \
	else \
	    ln -s "$$TARGET" "$$LINK"; \
	    echo "install_quotes: created $$LINK -> $$TARGET"; \
	fi

# Install a nightly crontab entry (idempotent — safe to run multiple times).
# MAILTO="" suppresses all cron mail.
install_crontab:
	@if crontab -l 2>/dev/null | grep -qF '$(CRON_CMD)'; then \
	    echo "crontab: already scheduled — no change"; \
	else \
	    { crontab -l 2>/dev/null; \
	      echo 'MAILTO=""'; \
	      echo '$(CRON_SCHED) $(CRON_CMD)'; \
	    } | crontab -; \
	    echo "crontab: added  $(CRON_SCHED)  $(CRON_CMD)"; \
	fi

# Show whether the crontab entry is installed.
show_crontab:
	@crontab -l 2>/dev/null | grep -F '$(CRON_CMD)' \
	    && echo "(scheduled)" \
	    || echo "(not scheduled)"
