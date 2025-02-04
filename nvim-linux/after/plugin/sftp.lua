vim.g.sftp_sync_servers = {
    sandbox_service = {
        local_path = '/home/revolko/work/kypo/backend-python/kypo-sandbox-service',
        remote_path = '/home/vagrant/kypo-sandbox-service/',
        host = '172.19.0.22',
        private_key = '/home/revolko/.ssh/local-demo', -- requires proper key, EDCSA not working
        username = 'vagrant',
    }
}

local sftp_group = vim.api.nvim_create_augroup('sftp_sync', { clear = True })
vim.api.nvim_create_autocmd({ 'BufWritePost' } , {
    pattern = '/home/revolko/work/kypo-sandbox-service/*',
    group = sfpt_group,
    command = 'SftpSend',
})
