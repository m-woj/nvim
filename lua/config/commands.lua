-- Delete all buffers that are not open in any window
function ClearBuffers()
    -- List of all buffer numbers
    local buffers = {}
    for i = 1, vim.fn.bufnr("$") do
        table.insert(buffers, i)
    end

    -- What tab page are we in?
    local currentTab = vim.fn.tabpagenr()

    -- Keep track of buffers that are currently open in any tab/window
    local openBuffers = {}

    -- Go through all tab pages
    for tab = 1, vim.fn.tabpagenr("$") do
        vim.cmd("tabnext " .. tab) -- Go to each tab

        -- Go through all windows in each tab
        for win = 1, vim.fn.winnr("$") do
            local thisbuf = vim.fn.winbufnr(win) -- Get the buffer in this window
            openBuffers[thisbuf] = true -- Mark this buffer as open
        end
    end

    -- Return to the original tab
    vim.cmd("tabnext " .. currentTab)

    -- Delete buffers that are not open in any window
    for _, buf in ipairs(buffers) do
        if not openBuffers[buf] and vim.fn.buflisted(buf) == 1 then
            vim.cmd("bwipeout " .. buf)
        end
    end
end

vim.api.nvim_create_user_command("ClearBuffers", function()
    ClearBuffers()
end, {})
