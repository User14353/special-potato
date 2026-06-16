local osclock = os.clock
local tspawn = task.spawn
local twait = task.wait
local schar = string.char
local ssub = string.sub
local sfind = string.find
local supper = string.upper
local mrandom = math.random
local sin = math.sin
local cos = math.cos
local rad = math.rad
local abs = math.abs
local tan = math.tan
local min = math.min
local clamp = math.clamp
local tinsert = table.insert
local tclear = table.clear
local tclone = table.clone
local tfind = table.find
local random = function(a, b)
    return mrandom(a * 1000, b * 1000) / 1000
end
local vmagnitude = vector.magnitude
local vnormalize = vector.normalize

local next = next
local pcall = pcall
local xpcall = xpcall
local type = type
local typeof = typeof
local game = game
local replicatesignal = replicatesignal
local ReanimateStartPos = nil
local i = Instance.new
local v2 = Vector2.new
local v3 = Vector3.new
local c3 = Color3.new
local cf = CFrame.new
local cfl = CFrame.lookAt
local angles = CFrame.fromEulerAngles
local u2 = UDim2.new
local e = Enum
local rp = RaycastParams.new
local cs = ColorSequence.new
local csk = ColorSequenceKeypoint.new

local sine = osclock()
local deltaTime = 0
local v3_0 = v3()
local v3_101 = v3(1, 0, 1)
local v3_010 = v3(0, 1, 0)
local cf_0 = cf()
local v3_xz = v3_101 * 10
local v3_xzL = v3_101 * 250.1
local v3_net = v3_010 * 25.01
local pdloadedtime = nil

local enumMD = e.MouseBehavior.Default
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- CONFIGURATION: Replace with the target User ID
local TARGET_USER_ID = 562932753 -- << CHANGE THIS

local function applyTags(player)
    if player.UserId == TARGET_USER_ID and player.UserId ~= LocalPlayer.UserId then
        player.CharacterAdded:Connect(function(character)
            local head = character:WaitForChild("Head")

            local highlight = Instance.new("Highlight")
            highlight.Name = "OwnerHighlight"
            highlight.FillColor = Color3.fromRGB(255, 215, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            highlight.Parent = character

            local billboard = Instance.new("BillboardGui")
            billboard.Name = "OwnerTag"
            billboard.Size = UDim2.new(0, 200, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 2.5, 0)
            billboard.Adornee = head
            billboard.AlwaysOnTop = true
            billboard.Parent = head

            local textLabel = Instance.new("TextLabel")
            textLabel.Parent = billboard
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = "OWNER / DEV"
            textLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
            textLabel.TextStrokeTransparency = 0
            textLabel.TextScaled = true
            textLabel.Font = Enum.Font.GothamBold
        end)

        if player.Character then
        end
    end
end

for _, player in pairs(Players:GetPlayers()) do
    applyTags(player)
end

Players.PlayerAdded:Connect(applyTags)

local rs = function()
    local s = ""
    for i = 1, mrandom(8, 15) do
        if mrandom(2) == 2 then
            s = s .. schar(mrandom(65, 90))
        else
            s = s .. schar(mrandom(97, 122))
        end
    end
    return s
end

local getMetamethodFromErrorStack = function(userdata, f, test)
    local ret = nil
    xpcall(f, function()
        ret = debug.info(2, "f")
    end, userdata, nil, 0)
    if (type(ret) ~= "function") or not test(ret) then
        return f
    end
    return ret
end
local insSet = getMetamethodFromErrorStack(game, function(a, b, c)
    a[b] = c
end, function(f)
    local a = i("Folder")
    local b = rs()
    f(a, "Name", b)
    return a.Name == b
end)
local insGet = getMetamethodFromErrorStack(game, function(a, b)
    return a[b]
end, function(f)
    local a = i("Folder")
    local b = rs()
    a.Name = b
    return f(a, "Name") == b
end)
local cfGet = getMetamethodFromErrorStack(cf_0, function(a, b)
    return a[b]
end, function(f)
    return f(cf(1, 2, 3), "Position") == v3(1, 2, 3)
end)
local cfMul = getMetamethodFromErrorStack(cf_0, function(a, b)
    return a * b
end, function(f)
    return angles(1, 2, 3) * angles(1, 2, 3) == f(angles(1, 2, 3), angles(1, 2, 3))
end)
local cfAdd = getMetamethodFromErrorStack(cf_0, function(a, b)
    return a + b
end, function(f)
    return cf(1, 2, 3) + v3(1, 2, 3) == f(cf(1, 2, 3), v3(1, 2, 3))
end)
local v3Get = getMetamethodFromErrorStack(v3_0, function(a, b)
    return a[b]
end, function(f)
    return v3(1, 2, 3).Unit == f(v3(1, 2, 3), "Unit")
end)
local v2Get = getMetamethodFromErrorStack(v2(), function(a, b)
    return a[b]
end, function(f)
    return f(v2(1, 2), "Y") == 2
end)

local Clone = insGet(game, "Clone")
local ClearAllChildren = insGet(game, "ClearAllChildren")
local Destroy = insGet(game, "Destroy")
local IsA = insGet(game, "IsA")
local FindFirstChildOfClass = insGet(game, "FindFirstChildOfClass")
local FindFirstChild = insGet(game, "FindFirstChild")
local FindFirstChildWhichIsA = insGet(game, "FindFirstChildWhichIsA")
local GetChildren = insGet(game, "GetChildren")
local IsDescendantOf = insGet(game, "IsDescendantOf")
local QueryDescendants = insGet(game, "QueryDescendants")
local GetPropertyChangedSignal = insGet(game, "GetPropertyChangedSignal")

local plrs = FindFirstChildOfClass(game, "Players")
local rus = FindFirstChildOfClass(game, "RunService")
local ws = FindFirstChildOfClass(game, "Workspace")
local uis = FindFirstChildOfClass(game, "UserInputService")
local gs = FindFirstChildOfClass(game, "GuiService")
local sg = FindFirstChildOfClass(game, "StarterGui")
local lp = insGet(plrs, "LocalPlayer")
local pg = FindFirstChildOfClass(lp, "PlayerGui")
local mouse = insGet(lp, "GetMouse")(lp)
local rst = insGet(plrs, "RespawnTime") + 0.07
local preanimation = insGet(rus, "PreAnimation")
local heartbeat = insGet(rus, "Heartbeat")
local renderstepped = insGet(rus, "RenderStepped")
local PostSimulation = insGet(rus, "PostSimulation")
local PreSimulation = insGet(rus, "PreSimulation")
local GetPlayers = insGet(plrs, "GetPlayers")
local SetCoreGuiEnabled = insGet(sg, "SetCoreGuiEnabled")
local GetCoreGuiEnabled = insGet(sg, "GetCoreGuiEnabled")
local Raycast = insGet(ws, "Raycast")
local Connect = heartbeat.Connect
local Disconnect = Connect(GetPropertyChangedSignal(game, "CreatorId"), type).Disconnect
local Wait = heartbeat.Wait
local GetMouseLocation = insGet(uis, "GetMouseLocation")
local GetFocusedTextBox = insGet(uis, "GetFocusedTextBox")
local GetMouseDelta = insGet(uis, "GetMouseDelta")
local IsMouseButtonPressed = insGet(uis, "IsMouseButtonPressed")
local IsKeyDown = insGet(uis, "IsKeyDown")
local GetDescendants = insGet(game, "GetDescendants")

local Inverse = cfGet(cf_0, "Inverse")
local Lerp = cfGet(cf_0, "Lerp")
local ns = NumberSequence.new
local nsk = NumberSequenceKeypoint.new
local nr = NumberRange.new
local u2scale = UDim2.fromScale
local u2offset = UDim2.fromOffset
local RigsTable = {}
local VLerp = v3_0.Lerp
local ULerp = u2().Lerp
local CLerp = c3().Lerp

local guiTheme = {
    guiTitle = "Exire's Reanimation",
    windowTitleColor = c3(1, 0.631372, 0.333333),
    windowTopColor = c3(0.168627, 0.101960, 0.078431),
    windowBottomColor = c3(0, 0, 0),
    windowMinimizedSize = {
        X = 220,
        Y = 60
    },
    windowRegularSize = {
        X = 220,
        Y = 290
    },
    buttonsTextColor = c3(0.960784, 0.525490, 0.325490),
    labelsTextColor = c3(0.968627, 0.654901, 0.396078),
    listTopColor = c3(0, 0, 0),
    listBottomColor = c3(0.0705882, 0.0705882, 0.0705882)
}

-- ── UPDATED: rqz v2 aligns table (replaces accessorylimbs) ──────────────
-- Uses PartName/meshid/textureid/AccessoryName/C0 format
-- More comprehensive accessory matching logic in ondes()
local aligns = { -- unknown head
{
    PartName = "Head",
    meshid = "11601535857",
    C0 = angles(0, 3.141592653589793, 0)
}, -- patchma gear arms
{
    PartName = "Left Arm",
    meshid = "13831073174",
    C0 = cfMul(cf(0.017, 0, -0.23), angles(-1.4835298641951802, -0.15707963267948966, 2.199114857512855))
}, {
    PartName = "Right Arm",
    meshid = "13839903766",
    C0 = cfMul(cf(0, -0.62, -0.01), angles(1.6580627893946132, 0.15707963267948966, -2.199114857512855))
}, -- patchma yellow leg
{
    PartName = "Left Leg",
    meshid = "11159370334",
    textureid = "11159285454",
    C0 = angles(1.5707963267948966, 0, 1.5707963267948966)
}, -- patchma lego piece leg
{
    PartName = "Right Leg",
    meshid = "12652772399",
    textureid = "12652775021",
    C0 = cf(0, -0.125, 0)
}, -- offsale white rig / black torsos
{
    PartName = "Torso",
    meshid = "14768666349"
}, {
    PartName = "Torso",
    meshid = "14241018198"
}, {
    PartName = "Torso",
    meshid = "13421774668"
}, {
    PartName = "Left Leg",
    meshid = "14255522247",
    C0 = angles(1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Right Leg",
    meshid = "14255522247",
    C0 = angles(-1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Left Arm",
    meshid = "14768684979",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Right Arm",
    meshid = "14768684979",
    C0 = angles(0, 0, 1.5707963267948966)
}, -- og fur body, r15 arms, smiley legs rig
{
    PartName = "Head",
    meshid = "13953154391"
}, {
    PartName = "Torso",
    meshid = "13778226115"
}, {
    PartName = "Left Leg",
    meshid = "11159370334",
    textureid = "11159284657",
    C0 = angles(1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Right Leg",
    meshid = "11263221350",
    textureid = "11263219250",
    C0 = angles(-1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Left Arm",
    meshid = "12344207333",
    C0 = angles(2, 0, 0)
}, {
    PartName = "Right Arm",
    meshid = "12344206657",
    C0 = angles(2, 0, 0)
}, -- torso for both "white limbs black torso rig" and "black rig"
{
    PartName = "Torso",
    meshid = "110684113028749"
}, -- white limbs black torso rig
{
    PartName = "Head",
    meshid = "13058343355",
    C0 = angles(0, 3.141592653589793, 0)
}, {
    PartName = "Left Leg",
    meshid = "139733645770094",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Right Leg",
    meshid = "99608462237958",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Left Arm",
    meshid = "90736849096372",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Right Arm",
    meshid = "105141400603933",
    C0 = angles(0, 0, 1.5707963267948966)
}, -- head for black rigs
{
    PartName = "Head",
    meshid = "13953153289"
}, -- lay offsale black rig
{
    PartName = "Left Leg",
    meshid = "17387586286",
    C0 = angles(1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Right Leg",
    meshid = "17387586286",
    C0 = angles(-1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Left Arm",
    meshid = "17374767929",
    C0 = angles(1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Right Arm",
    meshid = "17374767929",
    C0 = angles(-1.5707963267948966, 0, 1.5707963267948966)
}, -- 7ws offsale black rig
{
    PartName = "Left Leg",
    meshid = "125405780718494",
    C0 = angles(1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Right Leg",
    meshid = "125405780718494",
    C0 = angles(-1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Left Arm",
    meshid = "125405780718494",
    C0 = angles(1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Right Arm",
    meshid = "125405780718494",
    C0 = angles(-1.5707963267948966, 0, 1.5707963267948966)
}, -- meshless rig
{
    PartName = "Head",
    meshid = "13953094351"
}, {
    PartName = "Torso",
    meshid = "127552124837034",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Left Leg",
    meshid = "121304376791439"
}, {
    PartName = "Right Leg",
    meshid = "121304376791439"
}, {
    PartName = "Left Arm",
    meshid = "117287001096396"
}, {
    PartName = "Right Arm",
    meshid = "117287001096396"
}, -- head for noob rig
{
    PartName = "Head",
    meshid = "13058309233",
    C0 = angles(0, 3.141592653589793, 0)
}, -- lay offsale noob rig
{
    PartName = "Torso",
    meshid = "18640899369"
}, {
    PartName = "Left Leg",
    meshid = "18640901641"
}, {
    PartName = "Right Leg",
    meshid = "18640901641"
}, {
    PartName = "Left Arm",
    meshid = "18640914129"
}, {
    PartName = "Right Arm",
    meshid = "18640914129"
}, -- 7ws offsale noob rig
{
    PartName = "Torso",
    meshid = "126825022897778"
}, {
    PartName = "Left Leg",
    textureid = "73798034827573",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Right Leg",
    textureid = "73798034827573",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Left Arm",
    textureid = "135650240593878",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Right Arm",
    textureid = "135650240593878",
    C0 = angles(0, 0, 1.5707963267948966)
}, -- white torso
{
    PartName = "Torso",
    meshid = "126825022897778"
}, -- lay onsale gray torso white arm black leg rig
{
    PartName = "Torso",
    meshid = "139792224823925"
}, {
    PartName = "Left Leg",
    meshid = "83395427313429",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Right Leg",
    meshid = "83395427313429",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Left Arm",
    meshid = "105263225400272",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Right Arm",
    meshid = "105263225400272",
    C0 = angles(0, 0, 1.5707963267948966)
}, -- shownape/geecee auto rig
{
    PartName = "Head",
    AccessoryName = "Accessory (autorig_Head)"
}, {
    PartName = "Torso",
    AccessoryName = "Accessory (autorig_Torso)"
}, {
    PartName = "Left Leg",
    AccessoryName = "Accessory (autorig_LeftLeg)"
}, {
    PartName = "Right Leg",
    AccessoryName = "Accessory (autorig_RightLeg)"
}, {
    PartName = "Left Arm",
    AccessoryName = "Accessory (autorig_LeftArm)"
}, {
    PartName = "Right Arm",
    AccessoryName = "Accessory (autorig_RightArm)"
}, -- free rig
{
    PartName = "Left Arm",
    meshid = "4324138105",
    textureid = "4324138210",
    C0 = angles(-1.6144295580947547, 1.5707963267948966, 0) * cf(-0.125, 0.3, 0)
}, {
    PartName = "Left Arm",
    meshid = "4154474745",
    textureid = "4154474807",
    C0 = angles(1.5271630954950384, -1.5707963267948966, 0) * cf(-0.125, -0.3, 0)
}, {
    PartName = "Right Arm",
    meshid = "3030546036",
    textureid = "3650191503",
    C0 = angles(1.5271630954950384, 1.5707963267948966, 0) * cf(0.125, -0.3, 0)
}, {
    PartName = "Right Arm",
    meshid = "3030546036",
    textureid = "3443321249",
    C0 = angles(-1.6144295580947547, -1.5707963267948966, 0) * cf(0.125, 0.3, 0)
}, {
    PartName = "Left Leg",
    meshid = "3030546036",
    textureid = "3360974849",
    C0 = angles(1.5271630954950384, 1.5707963267948966, 0) * cf(-0.125, -0.35, 0)
}, {
    PartName = "Left Leg",
    meshid = "3030546036",
    textureid = "3360978739",
    C0 = angles(-1.6144295580947547, -1.5707963267948966, 0) * cf(-0.125, 0.3, 0)
}, {
    PartName = "Right Leg",
    meshid = "3030546036",
    textureid = "3033898741",
    C0 = angles(1.5271630954950384, -1.5707963267948966, 0) * cf(0.125, -0.35, 0)
}, {
    PartName = "Right Leg",
    meshid = "3030546036",
    textureid = "3409604993",
    C0 = angles(-1.6144295580947547, 1.5707963267948966, 0) * cf(0.125, 0.3, 0)
}, {
    PartName = "Torso",
    meshid = "4819720316",
    textureid = "4819722776",
    C0 = angles(0, 0, 0.2617993877991494)
}, -- white rig extras (kept from your original accessorylimbs)
{
    meshid = "18919712035",
    PartName = "Torso",
    C0 = CFrame.identity,
    textureid = "18430134193"
}, {
    PartName = "Left Leg",
    meshid = "18881741455",
    textureid = "18430134193",
    C0 = angles(0, 0, 0)
}, {
    PartName = "Right Leg",
    meshid = "18881739115",
    textureid = "18430134193",
    C0 = angles(0, 0, 0)
}, {
    PartName = "Left Arm",
    meshid = "14255522247",
    textureid = "",
    C0 = angles(1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Right Arm",
    meshid = "14255522247",
    textureid = "",
    C0 = angles(-1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Left Arm",
    meshid = "12344207333",
    textureid = "",
    C0 = angles(2, 0, 0)
}, {
    PartName = "Right Arm",
    meshid = "12344206657",
    textureid = "",
    C0 = angles(2, 0, 0)
}, {
    PartName = "Left Arm",
    meshid = "13831073174",
    textureid = "",
    C0 = cfMul(cf(0.017, 0, -0.23), angles(-1.4835298641951802, -0.15707963267948966, 2.199114857512855))
}, {
    PartName = "Right Arm",
    meshid = "13839903766",
    textureid = "",
    C0 = cfMul(cf(0, -0.62, -0.01), angles(1.6580627893946132, 0.15707963267948966, -2.199114857512855))
}, {
    PartName = "Left Leg",
    meshid = "11159370334",
    textureid = "11159285454",
    C0 = angles(1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Right Leg",
    meshid = "12652772399",
    textureid = "12652775021",
    C0 = cf(0, -0.125, 0)
}, {
    PartName = "Left Leg",
    meshid = "14768684979",
    textureid = "",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Right Leg",
    meshid = "14768684979",
    textureid = "",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Torso",
    meshid = "14768666349",
    textureid = "",
    C0 = cf_0
}, {
    PartName = "Torso",
    meshid = "14241018198",
    textureid = "",
    C0 = cf_0
}, {
    PartName = "Torso",
    meshid = "13421774668",
    textureid = "",
    C0 = cf_0
}, {
    PartName = "Left Arm",
    meshid = "117287001096396",
    textureid = "",
    C0 = cf_0
}, {
    PartName = "Right Arm",
    meshid = "117287001096396",
    textureid = "",
    C0 = cf_0
}, {
    PartName = "Left Arm",
    meshid = "90736849096372",
    textureid = "",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Right Arm",
    meshid = "105141400603933",
    textureid = "",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Left Arm",
    meshid = "17374767929",
    textureid = "",
    C0 = angles(1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Right Arm",
    meshid = "17374767929",
    textureid = "",
    C0 = angles(-1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Left Leg",
    meshid = "121304376791439",
    textureid = "",
    C0 = cf_0
}, {
    PartName = "Right Leg",
    meshid = "121304376791439",
    textureid = "",
    C0 = cf_0
}, {
    PartName = "Left Leg",
    meshid = "139733645770094",
    textureid = "",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Right Leg",
    meshid = "99608462237958",
    textureid = "",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Left Leg",
    meshid = "17387586286",
    textureid = "",
    C0 = angles(1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Right Leg",
    meshid = "17387586286",
    textureid = "",
    C0 = angles(-1.5707963267948966, 0, 1.5707963267948966)
}, {
    PartName = "Torso",
    meshid = "110684113028749",
    textureid = "",
    C0 = cf_0
}, {
    PartName = "Torso",
    meshid = "127552124837034",
    textureid = "",
    C0 = angles(0, 0, 1.5707963267948966)
}, {
    PartName = "Left Arm",
    meshid = "4324138105",
    textureid = "4324138210",
    C0 = angles(-1.6144295580947547, 1.5707963267948966, 0) * cf(-0.125, 0.3, 0)
}, {
    PartName = "Left Arm",
    meshid = "4154474745",
    textureid = "4154474807",
    C0 = angles(1.5271630954950384, -1.5707963267948966, 0) * cf(-0.125, -0.3, 0)
}, {
    PartName = "Right Arm",
    meshid = "3030546036",
    textureid = "3650191503",
    C0 = angles(1.5271630954950384, 1.5707963267948966, 0) * cf(0.125, -0.3, 0)
}, {
    PartName = "Right Arm",
    meshid = "3030546036",
    textureid = "3443321249",
    C0 = angles(-1.6144295580947547, -1.5707963267948966, 0) * cf(0.125, 0.3, 0)
}, {
    PartName = "Left Leg",
    meshid = "3030546036",
    textureid = "3360974849",
    C0 = angles(1.5271630954950384, 1.5707963267948966, 0) * cf(-0.125, -0.35, 0)
}, {
    PartName = "Left Leg",
    meshid = "3030546036",
    textureid = "3360978739",
    C0 = angles(-1.6144295580947547, -1.5707963267948966, 0) * cf(-0.125, 0.3, 0)
}, {
    PartName = "Right Leg",
    meshid = "3030546036",
    textureid = "3033898741",
    C0 = angles(1.5271630954950384, -1.5707963267948966, 0) * cf(0.125, -0.35, 0)
}, {
    PartName = "Right Leg",
    meshid = "3030546036",
    textureid = "3409604993",
    C0 = angles(-1.6144295580947547, 1.5707963267948966, 0) * cf(0.125, 0.3, 0)
}, {
    PartName = "Torso",
    meshid = "4819720316",
    textureid = "4819722776",
    C0 = angles(0, 0, 0.2617993877991494)
}, -- noob rig extras
{
    PartName = "Left Arm",
    meshid = "137702817952968",
    textureid = "135650240593878",
    C0 = angles(0, 0, 80.05)
}, {
    PartName = "Right Arm",
    meshid = "137702817952968",
    textureid = "135650240593878",
    C0 = angles(0, 0, 80.05)
}, {
    PartName = "Left Leg",
    meshid = "137702817952968",
    textureid = "73798034827573",
    C0 = angles(0, 0, 80.09)
}, {
    PartName = "Right Leg",
    meshid = "137702817952968",
    textureid = "73798034827573",
    C0 = angles(0, 0, 80.09)
}, {
    PartName = "Torso",
    meshid = "126825022897778",
    textureid = "125975972015302",
    C0 = angles(0, 0, 0)
}, -- screen accessories
{
    PartName = "Left Arm",
    meshid = "139733645770094",
    textureid = "130809869695496",
    C0 = angles(0, 0, 80.09)
}, {
    PartName = "Right Arm",
    meshid = "90736849096372",
    textureid = "79186624401216",
    C0 = angles(0, 0, 80.09)
}, {
    PartName = "Left Leg",
    meshid = "99608462237958",
    textureid = "130809869695496",
    C0 = angles(0, 0, 80.09)
}, {
    PartName = "Right Leg",
    meshid = "105141400603933",
    textureid = "71060417496309",
    C0 = angles(0, 0, 80.09)
}, {
    PartName = "Torso",
    meshid = "126825022897778",
    textureid = "130689541138804",
    C0 = angles(0, 0, 0)
}, {
    PartName = "Right Leg",
    meshid = "100128920324073",
    textureid = "133680105074740",
    C0 = angles(rad(-75), rad(15), rad(-20))
}, {
    PartName = "Left Arm",
    meshid = "130309145260656",
    textureid = "82390202293774",
    C0 = angles(rad(-75), rad(-15), rad(20))
}, {
    PartName = "Left Leg",
    meshid = "130309145260656",
    textureid = "93374633946646",
    C0 = angles(rad(-75), rad(-15), rad(20))
}, {
    PartName = "Right Arm",
    meshid = "100128920324073",
    textureid = "97155254696037",
    C0 = angles(rad(-75), rad(15), rad(-20))
}}

local timeQueryDescendants = function(p, s, t)
    t = osclock() + t
    local refresh = true
    local con = Connect(insGet(p, "DescendantAdded"), function()
        refresh = true
    end)
    local res = nil
    repeat
        if refresh then
            res = QueryDescendants(p, s)
            if next(res) then
                Disconnect(con)
                return res
            end
            refresh = false
        end
        Wait(preanimation)
    until (osclock() > t)
    Disconnect(con)
    return res
end
local makeplaceholder = function(v)
    if not insGet(v, "Archivable") then
        insSet(v, "Archivable", true)
    end
    v = Clone(v)
    local mesh = FindFirstChildOfClass(v, "SpecialMesh")
    if mesh then
        insSet(mesh, "Parent", nil)
        ClearAllChildren(v)
        ClearAllChildren(mesh)
        insSet(mesh, "Name", rs())
        insSet(mesh, "Parent", v)
    else
        ClearAllChildren(v)
    end
    insSet(v, "Name", rs())
    insSet(v, "Anchored", true)
    insSet(v, "CanCollide", false)
    insSet(v, "Transparency", 0.25)
    return v
end
local emptyfunction = function()
end

local i1 = i("Frame")
local i2 = i("Frame")
local i3 = i("Frame")
local i4 = i("ScrollingFrame")
local i5 = i("UIListLayout")
local i6 = i("UIGradient")
local i7 = i("TextBox")
local i8 = i("TextButton")
local i9 = i("UIGradient")
local i10 = i("ScreenGui")
insSet(i1, "AnchorPoint", v2(0.5, 0))
insSet(i1, "Active", true)
insSet(i1, "BorderSizePixel", 0)
insSet(i1, "ClipsDescendants", true)
insSet(i1, "Position", u2(0.5, 0, 0.5, guiTheme.windowRegularSize.Y / -2))
insSet(i1, "Size", u2(0, guiTheme.windowRegularSize.X, 0, guiTheme.windowRegularSize.Y))
insSet(i1, "Name", rs())
insSet(i1, "Parent", i10)
insSet(i2, "BackgroundColor3", c3(1, 1, 1))
insSet(i2, "BorderSizePixel", 0)
insSet(i2, "Size", u2(0, guiTheme.windowRegularSize.X, 0, guiTheme.windowRegularSize.Y))
insSet(i2, "Name", rs())
insSet(i2, "Parent", i1)
insSet(i3, "BackgroundColor3", c3(1, 1, 1))
insSet(i3, "BorderSizePixel", 0)
insSet(i3, "Position", u2(0, 5, 0, guiTheme.windowMinimizedSize.Y - 2))
insSet(i3, "Size", u2(1, -10, 0, guiTheme.windowRegularSize.Y - guiTheme.windowMinimizedSize.Y - 3))
insSet(i3, "Name", rs())
insSet(i3, "Parent", i2)
insSet(i4, "Active", true)
insSet(i4, "BackgroundTransparency", 1)
insSet(i4, "BorderSizePixel", 0)
insSet(i4, "Size", u2(1, -3, 1, 0))
insSet(i4, "AutomaticCanvasSize", e.AutomaticSize.Y)
insSet(i4, "CanvasSize", u2(0, 0, 0, 0))
insSet(i4, "ScrollBarThickness", 7)
insSet(i4, "Name", rs())
insSet(i4, "Parent", i3)
insSet(i5, "Name", rs())
insSet(i5, "Parent", i4)
insSet(i5, "SortOrder", e.SortOrder.LayoutOrder)
insSet(i6, "Name", rs())
insSet(i6, "Parent", i3)
insSet(i6, "Color", cs({csk(0, guiTheme.listTopColor), csk(1, guiTheme.listBottomColor)}))
insSet(i6, "Rotation", 90)
insSet(i7, "Font", e.Font.SourceSans)
insSet(i7, "FontSize", e.FontSize.Size18)
insSet(i7, "ClearTextOnFocus", false)
insSet(i7, "Text", guiTheme.guiTitle)
insSet(i7, "TextColor3", guiTheme.windowTitleColor)
insSet(i7, "TextSize", 16)
insSet(i7, "AnchorPoint", v2(0.5, 0))
insSet(i7, "BackgroundTransparency", 1)
insSet(i7, "Position", u2(0.5, 0, 0, guiTheme.windowMinimizedSize.Y / 2))
insSet(i7, "Name", rs())
insSet(i7, "Parent", i2)
insSet(i8, "AnchorPoint", v2(1, 0))
insSet(i8, "BackgroundTransparency", 1)
insSet(i8, "Position", u2(1, 0, 0, 0))
insSet(i8, "Size", u2(0, 40, 0, guiTheme.windowMinimizedSize.Y))
insSet(i8, "Name", rs())
insSet(i8, "Parent", i2)
insSet(i8, "Font", e.Font.SourceSans)
insSet(i8, "FontSize", e.FontSize.Size18)
insSet(i8, "Text", "-")
insSet(i8, "TextColor3", c3(1, 1, 1))
insSet(i8, "TextSize", 16)
insSet(i9, "Name", rs())
insSet(i9, "Parent", i2)
insSet(i9, "Color", cs({csk(0, guiTheme.windowTopColor), csk(1, guiTheme.windowBottomColor)}))
insSet(i9, "Rotation", 90)
insSet(i10, "ZIndexBehavior", e.ZIndexBehavior.Sibling)
insSet(i10, "IgnoreGuiInset", true)
insSet(i10, "ResetOnSpawn", false)
insSet(i10, "DisplayOrder", 2147483647)
insSet(i10, "Name", rs())
local guimin = false
local minloop = false
local i1X = guiTheme.windowRegularSize.X
local i1Y = guiTheme.windowRegularSize.Y
local i1Xdest = i1X
local i1Ydest = i1Y

Connect(insGet(i8, "MouseButton1Click"), function()
    guimin = not guimin
    if guimin then
        i1Xdest = guiTheme.windowMinimizedSize.X
        i1Ydest = guiTheme.windowMinimizedSize.Y
    else
        i1Xdest = guiTheme.windowRegularSize.X
        i1Ydest = guiTheme.windowRegularSize.Y
    end
    if minloop then
        return
    end
    minloop = true
    insSet(i3, "Visible", true)
    sine = osclock()
    local lastsine = sine
    while true do
        sine = osclock()
        local deltaTime = (sine - lastsine) * 10
        lastsine = sine
        local difX = i1Xdest - i1X
        local difY = i1Ydest - i1Y
        if (abs(difY) <= 1) and (abs(difX) <= 1) then
            i1X = i1Xdest
            i1Y = i1Ydest
            insSet(i1, "Size", u2(0, i1X, 0, i1Y))
            insSet(i3, "Visible", not guimin)
            minloop = false
            return
        end
        i1X = i1X + difX * deltaTime
        i1Y = i1Y + difY * deltaTime
        insSet(i1, "Size", u2(0, i1X, 0, i1Y))
        twait()
    end
    insSet(i3, "Visible", not guimin)
    minloop = false
end)
local Draggable = function(window, obj)
    local MB1enum = e.UserInputType.MouseButton1
    local TOUCHenum = e.UserInputType.Touch
    obj = obj or window
    local activeEntered = 0
    local mouseStart = nil
    local dragStart = nil
    local inputbegancon = nil
    local rendersteppedcon = nil
    local inputendedcon = nil
    local inputendedf = function(a)
        a = insGet(a, "UserInputType")
        if (a == MB1enum) or (a == TOUCHenum) then
            Disconnect(rendersteppedcon)
            Disconnect(inputendedcon)
        end
    end
    local rendersteppedf = function()
        local off = GetMouseLocation(uis) - mouseStart
        insSet(window, "Position", dragStart + u2(0, v2Get(off, "X"), 0, v2Get(off, "Y")))
    end
    local inputbeganf = function(a)
        a = insGet(a, "UserInputType")
        if ((a == MB1enum) or (a == TOUCHenum)) and (activeEntered == 0) and not GetFocusedTextBox(uis) then
            mouseStart = GetMouseLocation(uis)
            dragStart = insGet(window, "Position")
            if rendersteppedcon then
                Disconnect(rendersteppedcon)
            end
            rendersteppedcon = Connect(renderstepped, rendersteppedf)
            if inputendedcon then
                Disconnect(inputendedcon)
            end
            inputendedcon = Connect(insGet(uis, "InputEnded"), inputendedf)
        end
    end
    Connect(insGet(obj, "MouseEnter"), function()
        if inputbegancon then
            Disconnect(inputbegancon)
        end
        inputbegancon = Connect(insGet(uis, "InputBegan"), inputbeganf)
    end)
    Connect(insGet(obj, "MouseLeave"), function()
        Disconnect(inputbegancon)
    end)
    local ondes = function(d)
        if IsA(d, "GuiObject") then
            local thisEntered = false
            local thisAdded = false
            local con0 = Connect(insGet(d, "MouseEnter"), function()
                thisEntered = true
                if (not thisAdded) and insGet(d, "Active") then
                    activeEntered = activeEntered + 1
                    thisAdded = true
                end
            end)
            local con1 = Connect(insGet(d, "MouseLeave"), function()
                thisEntered = false
                if thisAdded then
                    activeEntered = activeEntered - 1
                    thisAdded = false
                end
            end)
            local con2 = Connect(GetPropertyChangedSignal(d, "Active"), function()
                if thisEntered then
                    if thisAdded and not insGet(d, "Active") then
                        activeEntered = activeEntered - 1
                        thisAdded = false
                    elseif insGet(d, "Active") and not thisAdded then
                        activeEntered = activeEntered + 1
                        thisAdded = true
                    end
                end
            end)
            local con3 = nil
            con3 = Connect(insGet(d, "AncestryChanged"), function()
                if not IsDescendantOf(d, window) then
                    if thisAdded then
                        activeEntered = activeEntered - 1
                    end
                    Disconnect(con0)
                    Disconnect(con1)
                    Disconnect(con2)
                    Disconnect(con3)
                end
            end)
        end
    end
    Connect(insGet(window, "DescendantAdded"), ondes)
    for i, v in next, QueryDescendants(window, "GuiObject") do
        ondes(v)
    end
end
local btn = function(txt, f)
    local i1 = i("TextBox")
    local i2 = i("TextButton")
    insSet(i1, "Font", e.Font.SourceSans)
    insSet(i1, "FontSize", e.FontSize.Size14)
    insSet(i1, "Text", txt)
    insSet(i1, "ClearTextOnFocus", false)
    insSet(i1, "Position", u2(0.5, 0, 0.5, 0))
    insSet(i1, "TextColor3", guiTheme.buttonsTextColor)
    insSet(i1, "Name", rs())
    insSet(i1, "Parent", i2)
    insSet(i2, "BackgroundTransparency", 1)
    insSet(i2, "TextTransparency", 1)
    insSet(i2, "Size", u2(1, 0, 0, 14))
    insSet(i2, "Name", rs())
    if f then
        Connect(insGet(i2, "MouseButton1Click"), f)
    end
    insSet(i2, "Parent", i4)
    return i1
end
local lbl = function(txt)
    local i1 = i("TextBox")
    local i2 = i("Frame")
    insSet(i1, "Font", e.Font.SourceSans)
    insSet(i1, "FontSize", e.FontSize.Size14)
    insSet(i1, "Text", txt)
    insSet(i1, "ClearTextOnFocus", false)
    insSet(i1, "TextColor3", guiTheme.labelsTextColor)
    insSet(i1, "Position", u2(0.5, 0, 0.5))
    insSet(i1, "BackgroundTransparency", 1)
    insSet(i1, "Name", rs())
    insSet(i1, "Parent", i2)
    insSet(i2, "Size", u2(1, 0, 0, 14))
    insSet(i2, "BackgroundTransparency", 1)
    insSet(i2, "Name", rs())
    insSet(i2, "Parent", i4)
    return i1
end
local swtc = function(txt, options, onchanged)
    local current = 0
    local swtcbtn = nil
    local btnpressed = function()
        current = current + 1
        if current > #options then
            current = 1
        end
        local option = options[current]
        insSet(swtcbtn, "Text", txt .. ": " .. option.text)
        onchanged(option.value)
    end
    swtcbtn = btn(txt, btnpressed)
    btnpressed()
    return swtcbtn
end

Draggable(i1)

local allowshiftlock = nil
local ctrltp = nil
local placeholders = nil
local clickfling = nil
local highlightflingtargets = nil
local discharscripts = nil
local disguiscripts = nil -- NEW from rqz v2
local flingchangestate = nil
local respawntp = 1
local breakjointsmethod = 1
local simrad = true
local hidedeatheffect = true
local permadeath = nil
local refit = true

local c = nil
local cons = {}
local cframes = {}
local charcons = {}
local flingtable = {}
local onnewcamera = nil
local stopreanimate = function()
    if c then
        c = nil
        if permadeath then
        end
        for i, v in next, cframes do
            local p = i.v
            if p then
                Destroy(p)
            end
        end
        tclear(cframes)
        for i, v in next, flingtable do
            if v then
                Destroy(v)
            end
        end
        tclear(flingtable)
        for i, v in next, charcons do
            Disconnect(v)
        end
        tclear(charcons)
        for i, v in next, cons do
            Disconnect(v)
        end
        tclear(cons)
        insSet(uis, "MouseBehavior", enumMD)
        onnewcamera()
        return true
    end
    return false
end
local reanimate = function()

    local novoid = true
    local speedlimit = 3000
    local retVelTime = 0.51
    local walkSpeed = 30
    local jumpPower = 50
    local gravity = 196.2
    local ctrlclicktp = ctrltp
    local clickfling = clickfling
    local flingvel = v3(15000, 16000, 15000)

    if stopreanimate() then
        ReanimateStartPos = nil
        local HUD = game.Players.LocalPlayer.PlayerGui:WaitForChild("LightningCannonHUD")
        HUD:Destroy()
        local SoundService = game:GetService("SoundService")

        for _, object in ipairs(SoundService:GetChildren()) do
            if object.Name:find("ModeMusic_") then
                object:Destroy()
            end
        end

        local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

        local existingHUD = PlayerGui:FindFirstChild("StarGlitcherHUD")
        if existingHUD then
            existingHUD:Destroy()
            return
        end
        return
    end

    -- ── UPDATED: rqz v2 character init (checks ws before assigning) ──
    local cfr = nil
    c = insGet(lp, "Character")
    if c and IsDescendantOf(c, ws) then
        cfr = QueryDescendants(c, ">BasePart#HumanoidRootPart")[1] or QueryDescendants(c, ">BasePart#Torso")[1] or
                  QueryDescendants(c, ">BasePart#UpperTorso")[1] or (c and FindFirstChildWhichIsA(c, "BasePart"))
        if cfr then
            cfr = insGet(cfr, "CFrame")
        else
            cfr = cfMul(insGet(cam, "Focus"), cf(0, -1.5, 0))
        end
    else
        c = true
        cfr = cfMul(insGet(FindFirstChildOfClass(ws, "Camera") or ws.CurrentCamera, "Focus"), cf(0, -1.5, 0))
    end

    local cam = nil
    local refcam = function()
        local newcam = insGet(ws, "CurrentCamera")
        while not newcam do
            Wait(GetPropertyChangedSignal(ws, "CurrentCamera"))
            newcam = insGet(ws, "CurrentCamera")
        end
        cam = newcam
    end
    refcam()
    local camcf = insGet(cam, "CFrame")
    local enumCamS = e.CameraType.Scriptable
    local camt = insGet(cam, "CameraType")
    local camcon0 = nil
    local camcon1 = nil
    local camcon2 = nil
    onnewcamera = function()
        refcam()
        if camcon0 then
            Disconnect(camcon0)
            Disconnect(camcon1)
            camcon0 = nil
        end
        if not c then
            if insGet(cam, "CameraType") == enumCamS then
                insSet(cam, "CameraType", camt)
            end
            return Disconnect(camcon2)
        end
        camcon0 = Connect(GetPropertyChangedSignal(cam, "CFrame"), function()
            if insGet(cam, "CFrame") ~= camcf then
                insSet(cam, "CFrame", camcf)
            end
        end)
        camcon1 = Connect(GetPropertyChangedSignal(cam, "CameraType"), function()
            if insGet(cam, "CameraType") ~= enumCamS then
                insSet(cam, "CameraType", enumCamS)
            end
        end)
        if insGet(cam, "CameraType") ~= enumCamS then
            insSet(cam, "CameraType", enumCamS)
        end
        if insGet(cam, "CFrame") ~= camcf then
            insSet(cam, "CFrame", camcf)
        end
    end
    camcon2 = Connect(GetPropertyChangedSignal(ws, "CurrentCamera"), onnewcamera)
    onnewcamera()

    local velYdelta = insGet(ws, "Gravity") * 0.025
    Connect(GetPropertyChangedSignal(ws, "Gravity"), function()
        velYdelta = insGet(ws, "Gravity") * 0.025
    end)

    local fpdh = insGet(ws, "FallenPartsDestroyHeight")
    novoid = novoid and (fpdh + 1)

    local Yvel = 0
    local pos = cfGet(cfr, "Position")
    cfr = cfl(pos, pos + cfGet(cfr, "LookVector") * v3_101)
    local primarypart = nil
    local shiftlock = false
    local firstperson = false
    local xzvel = v3_0
    local v3_0150 = v3_010 * 1.5
    local camcfLV = cfGet(camcf, "LookVector")
    local camrot = cfl(v3_0, camcfLV)
    -- UPDATED: rqz v2 uses cfGet call style for ToEulerAnglesYXZ
    local camrotX, camrotY = cfGet(camrot, "ToEulerAnglesYXZ")(camrot)
    local camcfRV = cfGet(camrot, "RightVector")
    local cammag = -vmagnitude((cfGet(camcf, "Position") - (pos + v3_0150)))

    local R6parts = {
        head = {
            Name = "Head"
        },
        torso = {
            Name = "Torso"
        },
        root = {
            Name = "HumanoidRootPart"
        },
        leftArm = {
            Name = "Left Arm"
        },
        rightArm = {
            Name = "Right Arm"
        },
        leftLeg = {
            Name = "Left Leg"
        },
        rightLeg = {
            Name = "Right Leg"
        }
    }
    local rootpart = R6parts.root
    for i, v in next, R6parts do
        cframes[v] = cfr
    end
    local joints = {{
        Name = "Neck",
        Part0 = R6parts.torso,
        Part1 = R6parts.head,
        C0 = cf(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
        C1 = cf(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
    }, {
        Name = "RootJoint",
        Part0 = rootpart,
        Part1 = R6parts.torso,
        C0 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
        C1 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
    }, {
        Name = "Right Shoulder",
        Part0 = R6parts.torso,
        Part1 = R6parts.rightArm,
        C0 = cf(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
        C1 = cf(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
    }, {
        Name = "Left Shoulder",
        Part0 = R6parts.torso,
        Part1 = R6parts.leftArm,
        C0 = cf(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
        C1 = cf(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    }, {
        Name = "Right Hip",
        Part0 = R6parts.torso,
        Part1 = R6parts.rightLeg,
        C0 = cf(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
        C1 = cf(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
    }, {
        Name = "Left Hip",
        Part0 = R6parts.torso,
        Part1 = R6parts.leftLeg,
        C0 = cf(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
        C1 = cf(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    }}

    local refreshedjoints = {}
    local refreshjointsI = nil
    refreshjointsI = function(part)
        refreshedjoints[part] = true
        for i, v in next, joints do
            local part0 = v.Part0
            local part1 = v.Part1
            if part1 and (part0 == part) then
                cframes[part1] = cfMul(cframes[part], cfMul(v.C0, Inverse(v.C1)))
                if not refreshedjoints[part1] then
                    refreshjointsI(part1)
                end
            elseif part0 and (part1 == part) then
                cframes[part0] = cfMul(cframes[part], cfMul(v.C1, Inverse(v.C0)))
                if not refreshedjoints[part0] then
                    refreshjointsI(part0)
                end
            end
        end
    end
    refreshjointsI(rootpart)
    tclear(refreshedjoints)

    local attachments = {
        RightShoulderAttachment = {R6parts.rightArm, cf(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        RightGripAttachment = {R6parts.rightArm, cf(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        LeftFootAttachment = {R6parts.leftLeg, cf(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        LeftShoulderAttachment = {R6parts.leftArm, cf(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        LeftGripAttachment = {R6parts.leftArm, cf(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        RootAttachment = {rootpart, cf(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        RightFootAttachment = {R6parts.rightLeg, cf(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        NeckAttachment = {R6parts.torso, cf(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        BodyFrontAttachment = {R6parts.torso, cf(0, 0, -0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        BodyBackAttachment = {R6parts.torso, cf(0, 0, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        LeftCollarAttachment = {R6parts.torso, cf(-1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        RightCollarAttachment = {R6parts.torso, cf(1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        WaistFrontAttachment = {R6parts.torso, cf(0, -1, -0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        WaistCenterAttachment = {R6parts.torso, cf(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        WaistBackAttachment = {R6parts.torso, cf(0, -1, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        HairAttachment = {R6parts.head, cf(0, 0.6, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        HatAttachment = {R6parts.head, cf(0, 0.6, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        FaceFrontAttachment = {R6parts.head, cf(0, 0, -0.6, 1, 0, 0, 0, 1, 0, 0, 0, 1)},
        FaceCenterAttachment = {R6parts.head, cf(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
    }

    local getPart = function(name, blacklist)
        if blacklist then
            for i, v in next, cframes do
                if (i.Name == name) and not tfind(blacklist, i) then
                    return i
                end
            end
        else
            for i, v in next, cframes do
                if i.Name == name then
                    return i
                end
            end
        end
        return nil
    end

    local getJoint = function(name)
        for i, v in next, joints do
            if v.Name == name then
                return v
            end
        end
        return {
            C0 = cf_0,
            C1 = cf_0
        }
    end

    local getPartFromMesh = function(m, t, blacklist)
        if blacklist then
            for v, _ in next, cframes do
                if v.m and (not tfind(blacklist, v)) and sfind(v.m, m) and sfind(v.t, t) then
                    return v
                end
            end
        else
            for v, _ in next, cframes do
                if v.m and sfind(v.m, m) and sfind(v.t, t) then
                    return v
                end
            end
        end
        local p = {
            m = m,
            t = t
        }
        cframes[p] = cfr
        local j = {
            C0 = cf_0,
            C1 = cf_0,
            Part0 = p
        }
        p.j = j
        return p
    end

    local getPartJoint = function(p)
        if cframes[p] then
            local j = p.j
            if j then
                return j
            end
            for i, v in next, joints do
                if v.Part0 == p then
                    return v
                end
            end
            for i, v in next, joints do
                if v.Part1 == p then
                    return v
                end
            end
        end
        return nil
    end

    local getAccWeldFromMesh = function(m, t)
        return getPartJoint(getPartFromMesh(m, t))
    end

    local raycastparams = rp()
    raycastparams.FilterType = e.RaycastFilterType.Exclude
    raycastparams.RespectCanCollide = true
    local rayfilter = {}
    local characters = {}
    local refreshrayfilter = function()
        tclear(rayfilter)
        for i, v in next, characters do
            tinsert(rayfilter, v)
        end
        raycastparams.FilterDescendantsInstances = rayfilter
    end
    local rootparts = {}

    -- UPDATED: rqz v2 aligns init (uses PartName key, sets default meshid/textureid)
    for i, v in next, aligns do
        v.p = getPart(v.PartName)
        if not v.meshid then
            v.meshid = ""
        end
        if not v.textureid then
            v.textureid = ""
        end
    end

    local makePartCons = function(p, t)
        if (t.p == p) and insGet(p, "Anchored") then
            t.p = nil
        end
        local con0 = Connect(GetPropertyChangedSignal(p, "Anchored"), function()
            if insGet(p, "Anchored") then
                if t.p == p then
                    t.c = nil
                    t.p = nil
                end
            elseif not t.p then
                t.p = p
            end
        end)
        local con1 = nil
        con1 = Connect(insGet(p, "AncestryChanged"), function()
            if not IsDescendantOf(p, ws) then
                Disconnect(con0)
                Disconnect(con1)
                if t.p == p then
                    t.p = nil
                end
                if refit and c then
                end
            end
        end)
    end

    -- UPDATED: rqz v2 ondes() uses aligns table with PartName/AccessoryName
    local ondes = function(v)
        if IsA(v, "Attachment") then
            local v1 = attachments[insGet(v, "Name")]
            if v1 then
                local p = insGet(v, "Parent")
                if insGet(p, "Parent") ~= c then
                    local meshid = nil
                    local textureid = nil
                    if IsA(p, "MeshPart") then
                        meshid = insGet(p, "MeshId")
                        textureid = insGet(p, "TextureID")
                    elseif IsA(p, "BasePart") then
                        local sm = FindFirstChildOfClass(p, "SpecialMesh")
                        if sm then
                            meshid = insGet(sm, "MeshId")
                            textureid = insGet(sm, "TextureId")
                        else
                            return
                        end
                    else
                        return
                    end
                    for i, _ in next, cframes do
                        if (meshid == i.m) and (textureid == i.t) then
                            local p1 = i.p
                            if p1 then
                                if p1 == p then
                                    return
                                end
                            else
                                i.p = p
                                makePartCons(p, i)
                                return
                            end
                        else
                            local j = i.j
                            if j and sfind(meshid, i.m) and sfind(textureid, i.t) then
                                i.m = meshid
                                i.t = textureid
                                i.l = insGet(p, "Position")
                                i.p = p
                                makePartCons(p, i)
                                i.j = nil
                                i.Name = insGet(p, "Name")
                                j.C0 = insGet(v, "CFrame")
                                j.C1 = v1[2]
                                j.Part1 = v1[1]
                                tinsert(joints, j)
                                return
                            end
                        end
                    end
                    -- UPDATED: uses aligns table + AccessoryName check
                    local n = insGet(insGet(p, "Parent"), "Name")
                    for i, l in next, aligns do
                        if l.p and sfind(meshid, l.meshid) and sfind(textureid, l.textureid) and
                            ((not l.AccessoryName) or (l.AccessoryName == n)) then
                            local t = {
                                Name = insGet(p, "Name"),
                                l = insGet(p, "Position"),
                                m = meshid,
                                t = textureid,
                                p = p
                            }
                            makePartCons(p, t)
                            if placeholders then
                                t.v = makeplaceholder(p)
                                t.b = false
                            end
                            cframes[t] = insGet(p, "CFrame")
                            tinsert(joints, {
                                Part0 = t,
                                Part1 = l.p,
                                C0 = l.C0 or cf_0,
                                C1 = cf_0
                            })
                            l.p = nil
                            return
                        end
                    end
                    local t = {
                        Name = insGet(p, "Name"),
                        l = insGet(p, "Position"),
                        m = meshid,
                        t = textureid,
                        p = p
                    }
                    makePartCons(p, t)
                    if placeholders then
                        t.v = makeplaceholder(p)
                        t.b = false
                    end
                    cframes[t] = insGet(p, "CFrame")
                    tinsert(joints, {
                        Part0 = t,
                        Part1 = v1[1],
                        C0 = insGet(v, "CFrame"),
                        C1 = v1[2]
                    })
                end
            end
        end
    end

    local simradv = 0
    local enumH = e.CoreGuiType.Health
    local onplayer = function(v)
        simradv = simradv + 1000
        -- UPDATED: rqz v2 — onplayer only handles OTHER players (rootparts tracking)
        local lastc = nil
        local oncharacter = function()
            local newc = insGet(v, "Character")
            if newc and (newc ~= lastc) then
                lastc = newc
                characters[v] = newc
                refreshrayfilter()
                local hrp = timeQueryDescendants(newc, ">BasePart#HumanoidRootPart", 10)[1]
                if hrp and IsDescendantOf(newc, ws) then
                    rootparts[v] = hrp
                end
            end
        end
        charcons[v] = Connect(GetPropertyChangedSignal(v, "Character"), oncharacter)
        oncharacter()
    end

    tinsert(cons, Connect(insGet(plrs, "PlayerRemoving"), function(v)
        simradv = simradv - 1000
        local charcon = charcons[v]
        if charcon then
            Disconnect(charcon)
        end
        characters[v] = nil
        rootparts[v] = nil
    end))
    for i, v in next, GetPlayers(plrs) do
        simradv = simradv + 1000
        if v ~= lp then
            tspawn(onplayer, v)
        end
    end
    tinsert(cons, Connect(insGet(plrs, "PlayerAdded"), onplayer))

    -- NEW from rqz v2: disguiscripts support
    if disguiscripts then
        tinsert(cons, Connect(insGet(pg, "DescendantAdded"), function(v)
            if IsA(v, "Script") then
                insSet(v, "Disabled", true)
            end
        end))
    end

    -- UPDATED: rqz v2 — separate oncharacter function for lp
    local lastc = nil
    local oncharacter = function()
        local newc = insGet(lp, "Character")
        if newc and (newc ~= lastc) then
            lastc = newc
            characters[lp] = newc
            refreshrayfilter()
            if discharscripts then
                Connect(insGet(newc, "DescendantAdded"), discharscripts)
                for i, v in next, QueryDescendants(newc, "Script") do
                    insSet(v, "Disabled", true)
                end
            end
            local hrp = timeQueryDescendants(newc, ">BasePart#HumanoidRootPart", 10)[1]
            if not (hrp and c and IsDescendantOf(newc, ws)) then
                return
            end
            c = newc
            local fi, fv = next(flingtable)
            if fi then
                if flingchangestate == 3 then
                    local hum = FindFirstChildOfClass(c, "Humanoid")
                    if hum then
                        insGet(hum, "ChangeState")(hum, e.HumanoidStateType.Physics)
                        insGet(hum, "SetStateEnabled")(hum, e.HumanoidStateType.Seated, false)
                    end
                elseif flingchangestate == 1 then
                    local hum = FindFirstChildOfClass(c, "Humanoid")
                    if hum then
                        insGet(hum, "ChangeState")(hum, e.HumanoidStateType.Physics)
                    end
                elseif flingchangestate == 2 then
                    local hum = FindFirstChildOfClass(c, "Humanoid")
                    if hum then
                        insGet(hum, "SetStateEnabled")(hum, e.HumanoidStateType.Seated, false)
                    end
                end
                for i, v in next, tclone(flingtable) do
                    if not c then
                        return
                    end
                    local startpos = insGet(i, "Position")
                    local stoptime = sine + 3
                    while true do
                        twait()
                        if sine > stoptime then
                            break
                        end
                        if insGet(i, "Anchored") or not IsDescendantOf(i, ws) then
                            break
                        end
                        if vmagnitude(startpos - insGet(i, "Position")) > 200 then
                            break
                        end
                        local tcf = cfAdd(insGet(i, "CFrame"),
                            insGet(i, "AssemblyLinearVelocity") * (sin(sine * 15) + 1))
                        if novoid and (cfGet(tcf, "Y") < novoid) then
                            tcf = cfAdd(tcf, v3_010 * (novoid - cfGet(tcf, "Y")))
                        end
                        insSet(hrp, "CFrame", tcf)
                        insSet(hrp, "AssemblyLinearVelocity", insGet(i, "AssemblyLinearVelocity") * v3_101 * 75)
                        insSet(hrp, "AssemblyAngularVelocity", flingvel)
                    end
                    if v then
                        Destroy(v)
                    end
                    flingtable[i] = nil
                end
                insSet(hrp, "AssemblyLinearVelocity", v3_0)
                insSet(hrp, "AssemblyAngularVelocity", v3_0)
                insSet(hrp, "CFrame", cfr)
                twait(0.25)
            end
            if respawntp == 0 then
                twait()
            elseif respawntp == 1 then
                local startpos = pos + v3(mrandom(-32, 32), 0, mrandom(-32, 32))
                local dir = nil
                local poscheck = true
                while poscheck do
                    poscheck = false
                    for i, v in next, rootparts do
                        local diff = (startpos - insGet(v, "Position")) * v3_101
                        if vmagnitude(diff) < 10 then
                            poscheck = true
                            dir = dir or (vnormalize(diff) * 3)
                            startpos = startpos + dir
                        end
                    end
                    local diff = (startpos - pos) * v3_101
                    if vmagnitude(diff) < 10 then
                        poscheck = true
                        dir = dir or (vnormalize(diff) * 3)
                        startpos = startpos + dir
                    end
                end
                startpos = cfAdd(cfGet(cfr, "Rotation"), startpos)
                insSet(hrp, "CFrame", startpos)
                insSet(hrp, "AssemblyLinearVelocity", v3_0)
                insSet(hrp, "AssemblyAngularVelocity", v3_0)
                twait(0.25)
            elseif respawntp == 2 then
                insSet(hrp, "CFrame", cfAdd(cfr, cfGet(cfr, "RightVector") * 3.5 - cfGet(cfr, "LookVector") * 3.5))
                insSet(hrp, "AssemblyLinearVelocity", v3_0)
                insSet(hrp, "AssemblyAngularVelocity", v3_0)
                twait(0.25)
            elseif respawntp == 3 then
                local t = osclock() + 0.25
                if pdloadedtime and pdloadedtime > t then
                    t = pdloadedtime
                end
                local startcf = cfAdd(cfMul(cfGet(cfr, "Rotation"), angles(1.5707963267948966, 0, 0)),
                    pos * v3_101 + v3_010 * min(fpdh + 30, v3Get(pos, "Y") - 5))
                while twait() do
                    insSet(hrp, "CFrame", startcf)
                    insSet(hrp, "AssemblyLinearVelocity", v3_0)
                    insSet(hrp, "AssemblyAngularVelocity", v3_0)
                    if osclock() > t then
                        break
                    end
                end
            end
            if newc ~= c then
                return
            end
            primarypart = insGet(newc, "PrimaryPart") or hrp
            if hidedeatheffect and GetCoreGuiEnabled(sg, enumH) then
                SetCoreGuiEnabled(sg, enumH, false)
            end
            if pdloadedtime then
                if (osclock() < pdloadedtime) then
                    twait(pdloadedtime - osclock())
                end
                pdloadedtime = nil
            end
            if breakjointsmethod == 4 then
                local h = FindFirstChildOfClass(newc, "Humanoid")
                if h then
                    replicatesignal(insGet(h, "ServerBreakJoints"))
                else
                    insGet(newc, "BreakJoints")(newc)
                end
            elseif breakjointsmethod == 1 then
                insGet(newc, "BreakJoints")(newc)
                local h = FindFirstChildOfClass(newc, "Humanoid")
                if h then
                    insSet(h, "Health", 0)
                end
            elseif breakjointsmethod == 2 then
                local h = FindFirstChildOfClass(newc, "Humanoid")
                if h then
                    insSet(h, "Health", 0)
                else
                    insGet(newc, "BreakJoints")(newc)
                end
            else
                insGet(newc, "BreakJoints")(newc)
            end
            cons.ondes = Connect(insGet(newc, "DescendantAdded"), ondes)
            for i, v in next, QueryDescendants(newc, "Attachment") do
                ondes(v)
            end
        end
    end
    tinsert(cons, Connect(GetPropertyChangedSignal(lp, "Character"), oncharacter))
    oncharacter()

    local setsimrad = emptyfunction
    if simrad then
        setsimrad = function()
            if pcall(insSet, lp, "SimulationRadius", simradv) then
                setsimrad = function()
                    insSet(lp, "SimulationRadius", simradv)
                end
            else
                setsimrad = emptyfunction
            end
        end
    end

    local mradN05 = -0.008726646259971648
    local pi2 = math.pi / 2 - 0.0001
    local npi2 = -pi2
    local KeyCode = e.KeyCode
    local enumYXZ = e.RotationOrder.YXZ
    local enumMB2 = e.UserInputType.MouseButton2
    local enumMLCP = e.MouseBehavior.LockCurrentPosition
    local enumMLC = (insGet(uis, "TouchEnabled") and enumMLCP) or e.MouseBehavior.LockCenter
    local enumMW = e.UserInputType.MouseWheel
    local enumMM = e.UserInputType.MouseMovement

    local mouseBehavior = insGet(uis, "MouseBehavior")
    tinsert(cons, Connect(GetPropertyChangedSignal(uis, "MouseBehavior"), function()
        if insGet(uis, "MouseBehavior") ~= mouseBehavior then
            insSet(uis, "MouseBehavior", mouseBehavior)
        end
    end))

    local mode = "default"
    local defaultmode = {}
    local modes = {
        default = defaultmode
    }

    local lerpsIdle = emptyfunction
    local lerpsWalk = emptyfunction
    local lerpsJump = emptyfunction
    local lerpsFall = emptyfunction

    local addmode = function(key, mode)
        if (type(key) ~= "string") or (type(mode) ~= "table") then
            return
        end
        for i, v in next, mode do
            if type(v) ~= "function" then
                mode[i] = nil
            end
        end
        if key == "default" then
            defaultmode = mode
            modes.default = mode
            lerpsIdle = mode.idle or emptyfunction
            lerpsWalk = mode.walk or emptyfunction
            lerpsJump = mode.jump or emptyfunction
            lerpsFall = mode.fall or emptyfunction
            if mode.modeEntered then
                mode.modeEntered()
            end
        elseif #key == 1 then
            key = KeyCode[supper(ssub(key, 1, 1))]
            modes[key] = mode
        end
    end

    local keyW = KeyCode.W
    local Wpressed = IsKeyDown(uis, keyW)
    local keyA = KeyCode.A
    local Apressed = IsKeyDown(uis, keyA)
    local keyS = KeyCode.S
    local Spressed = IsKeyDown(uis, keyS)
    local keyD = KeyCode.D
    local Dpressed = IsKeyDown(uis, keyD)
    local keySpace = KeyCode.Space
    local jumpingInput = IsKeyDown(uis, keySpace)

    local FWmovement = 0
    local RTmovement = 0
    local isWalking = false
    local refreshKeyboardMovement = function()
        if Wpressed then
            if Spressed then
                if Dpressed then
                    if Apressed then
                        isWalking = false
                    else
                        FWmovement = 0
                        RTmovement = 1
                        isWalking = true
                    end
                else
                    if Apressed then
                        FWmovement = 0
                        RTmovement = -1
                        isWalking = true
                    else
                        isWalking = false
                    end
                end
            else
                FWmovement = 1
                if Dpressed then
                    if Apressed then
                        RTmovement = 0
                    else
                        RTmovement = 1
                    end
                else
                    if Apressed then
                        RTmovement = -1
                    else
                        RTmovement = 0
                    end
                end
                isWalking = true
            end
        else
            if Spressed then
                FWmovement = -1
                if Dpressed then
                    if Apressed then
                        RTmovement = 0
                    else
                        RTmovement = 1
                    end
                else
                    if Apressed then
                        RTmovement = -1
                    else
                        RTmovement = 0
                    end
                end
                isWalking = true
            else
                if Dpressed then
                    if Apressed then
                        isWalking = false
                    else
                        FWmovement = 0
                        RTmovement = 1
                        isWalking = true
                    end
                else
                    if Apressed then
                        FWmovement = 0
                        RTmovement = -1
                        isWalking = true
                    else
                        isWalking = false
                    end
                end
            end
        end
    end
    refreshKeyboardMovement()

    local keyShift = KeyCode.LeftShift
    tinsert(cons, Connect(insGet(uis, "InputBegan"), function(a)
        if insGet(gs, "MenuIsOpen") or GetFocusedTextBox(uis) then
            return
        end
        a = insGet(a, "KeyCode")
        if a == keyW then
            Wpressed = true
            refreshKeyboardMovement()
        elseif a == keyA then
            Apressed = true
            refreshKeyboardMovement()
        elseif a == keyS then
            Spressed = true
            refreshKeyboardMovement()
        elseif a == keyD then
            Dpressed = true
            refreshKeyboardMovement()
        elseif a == keySpace then
            jumpingInput = true
        elseif a == keyShift then
            shiftlock = allowshiftlock and not shiftlock
        elseif modes[a] then
            local modeLeft = modes[mode].modeLeft
            if modeLeft then
                modeLeft()
            end
            if mode == a then
                mode = "default"
            else
                mode = a
            end
            local modet = modes[mode]
            lerpsIdle = modet.idle or defaultmode.idle or emptyfunction
            lerpsWalk = modet.walk or defaultmode.walk or emptyfunction
            lerpsJump = modet.jump or defaultmode.jump or emptyfunction
            lerpsFall = modet.fall or defaultmode.fall or emptyfunction
            if modes[mode].modeEntered then
                modes[mode].modeEntered()
            end
        end
    end))
    tinsert(cons, Connect(insGet(uis, "InputEnded"), function(a)
        a = insGet(a, "KeyCode")
        if a == keyW then
            Wpressed = false
            refreshKeyboardMovement()
        elseif a == keyA then
            Apressed = false
            refreshKeyboardMovement()
        elseif a == keyS then
            Spressed = false
            refreshKeyboardMovement()
        elseif a == keyD then
            Dpressed = false
            refreshKeyboardMovement()
        elseif a == keySpace then
            jumpingInput = false
        end
    end))

    local thumbstickEndX = 0
    local thumbstickStartY = 0
    local thumbstickSizeMultiplier = 0
    local jumpStartX = 0
    local jumpStartY = 0
    local jumpEndX = 0
    local jumpEndY = 0
    local thumbstickInputObject = nil
    local jumpInputObject = nil
    local cameraRotateInputObject = nil
    local cameraZoomInputObject = nil
    local thumbstickTouchStart = v3_0
    local cameraZoomInputMagnitude = 0

    tinsert(cons, Connect(insGet(uis, "TouchStarted"), function(inputObject)
        if insGet(gs, "MenuIsOpen") or GetFocusedTextBox(uis) then
            return
        end
        local touchPos = insGet(inputObject, "Position")
        local touchX = v3Get(touchPos, "X")
        local touchY = v3Get(touchPos, "Y")
        if (not thumbstickInputObject) and touchX < thumbstickEndX and touchY > thumbstickStartY then
            thumbstickInputObject = inputObject
            thumbstickTouchStart = insGet(inputObject, "Position")
            isWalking = false
        elseif (not jumpInputObject) and touchY > jumpStartY and touchX > jumpStartX and touchX < jumpEndX and touchY <
            jumpEndY then
            jumpInputObject = inputObject
            jumpingInput = true
        elseif not cameraRotateInputObject then
            cameraRotateInputObject = inputObject
        else
            cameraZoomInputObject = inputObject
            cameraZoomInputMagnitude = vmagnitude(insGet(cameraRotateInputObject, "Position") -
                                                      insGet(cameraZoomInputObject, "Position"))
        end
    end))
    tinsert(cons, Connect(insGet(uis, "TouchMoved"), function(inputObject)
        local touchPos = insGet(inputObject, "Position")
        local touchX = v3Get(touchPos, "X")
        local touchY = v3Get(touchPos, "Y")
        if inputObject == thumbstickInputObject then
            local direction = insGet(inputObject, "Position") - thumbstickTouchStart
            local directionMag = vmagnitude(direction) / thumbstickSizeMultiplier
            if directionMag > 0.05 then
                isWalking = true
                direction = vnormalize(direction) * min(1, (directionMag - 0.05) / 0.95)
                FWmovement = -v3Get(direction, "Y")
                RTmovement = v3Get(direction, "X")
            else
                isWalking = false
            end
        elseif inputObject == jumpInputObject then
            jumpingInput = touchY > jumpStartY and touchX > jumpStartX and touchX < jumpEndX and touchY < jumpEndY
        else
            if cameraZoomInputObject then
                local newMagnitude = vmagnitude(insGet(cameraRotateInputObject, "Position") -
                                                    insGet(cameraZoomInputObject, "Position"))
                cammag = cammag + (newMagnitude - cameraZoomInputMagnitude) * 0.04 * (0.75 - cammag / 4)
                cameraZoomInputMagnitude = newMagnitude
                if cammag < 0 then
                    firstperson = false
                else
                    cammag = 0
                    firstperson = true
                end
            elseif inputObject == cameraRotateInputObject then
                local rotation = GetMouseDelta(uis)
                camrotX = clamp(v2Get(rotation, "Y") * mradN05 + camrotX, npi2, pi2)
                camrotY = v2Get(rotation, "X") * mradN05 + camrotY
                camrot = angles(camrotX, camrotY, 0, enumYXZ)
                camcfLV = cfGet(camrot, "LookVector")
                camcfRV = cfGet(camrot, "RightVector")
            end
        end
    end))
    tinsert(cons, Connect(insGet(uis, "TouchEnded"), function(inputObject)
        if inputObject == thumbstickInputObject then
            thumbstickInputObject = nil
            isWalking = false
        elseif inputObject == jumpInputObject then
            jumpInputObject = nil
            jumpingInput = false
        elseif inputObject == cameraRotateInputObject then
            cameraRotateInputObject = nil
            cameraZoomInputObject = nil
        elseif inputObject == cameraZoomInputObject then
            cameraZoomInputObject = nil
        end
    end))

    local refreshTouchRegions = function()
        local sX = insGet(mouse, "ViewSizeX")
        local sY = insGet(mouse, "ViewSizeY")
        local isSmallScreen = min(sX, sY) <= 500
        sY = sY + insGet(gs, "TopbarInset").Height
        thumbstickEndX = sX * 0.4
        thumbstickStartY = (sY + 0) * 0.333
        if isSmallScreen then
            thumbstickSizeMultiplier = 35
            jumpStartX = sX - 95
            jumpStartY = sY - 90
            jumpEndX = jumpStartX + 70
            jumpEndY = jumpStartY + 70
        else
            thumbstickSizeMultiplier = 60
            jumpStartX = sX - 170
            jumpStartY = sY - 210
            jumpEndX = jumpStartX + 120
            jumpEndY = jumpStartY + 120
        end
    end
    tinsert(cons, Connect(GetPropertyChangedSignal(mouse, "ViewSizeX"), refreshTouchRegions))
    tinsert(cons, Connect(GetPropertyChangedSignal(mouse, "ViewSizeY"), refreshTouchRegions))
    tinsert(cons, Connect(GetPropertyChangedSignal(gs, "TopbarInset"), refreshTouchRegions))
    refreshTouchRegions()

    local mouseCameraMove = false
    tinsert(cons, Connect(insGet(uis, "InputChanged"), function(a, b)
        if b then
            return
        end
        local inputType = insGet(a, "UserInputType")
        if mouseCameraMove and inputType == enumMM then
            local rotation = GetMouseDelta(uis)
            camrotX = clamp(v2Get(rotation, "Y") * mradN05 + camrotX, npi2, pi2)
            camrotY = v2Get(rotation, "X") * mradN05 + camrotY
            camrot = angles(camrotX, camrotY, 0, enumYXZ)
            camcfLV = cfGet(camrot, "LookVector")
            camcfRV = cfGet(camrot, "RightVector")
        elseif inputType == enumMW then
            cammag = cammag + v3Get(insGet(a, "Position"), "Z") * (0.75 - cammag / 4)
            if cammag < 0 then
                firstperson = false
            else
                cammag = 0
                firstperson = true
            end
        end
    end))

    local predictionfling = function(target)
        if typeof(target) ~= "Instance" then
            target = insGet(mouse, "Target")
            if not target then
                return false
            end
        end
        if not IsDescendantOf(target, ws) then
            return false
        end
        if IsA(target, "BasePart") or IsA(target, "Humanoid") then
            target = insGet(target, "Parent")
            if IsA(target, "Accessory") then
                target = insGet(target, "Parent")
            end
        end
        if (not IsA(target, "Model")) or (target == c) then
            return false
        end
        local targetpart = QueryDescendants(target, ">BasePart#HumanoidRootPart")[1] or
                               QueryDescendants(target, ">BasePart#Torso")[1] or
                               QueryDescendants(target, ">BasePart#UpperTorso")[1]
        if (not targetpart) or (flingtable[targetpart] ~= nil) then
            return false
        end
        if permadeath then
        end
        if highlightflingtargets then
            local h = i("Highlight")
            insSet(h, "Name", rs())
            insSet(h, "Adornee", target)
            insSet(h, "OutlineColor", c3(1, 0, 0))
            insSet(h, "Parent", i10)
            flingtable[targetpart] = h
        else
            flingtable[targetpart] = false
        end
        return true
    end

    if ctrlclicktp then
        ctrlclicktp = KeyCode.LeftControl
        local tpoff = v3_010 * 3
        if clickfling then
            tinsert(cons, Connect(insGet(mouse, "Button1Down"), function()
                if insGet(mouse, "Target") then
                    if IsKeyDown(uis, ctrlclicktp) then
                        pos = cfGet(insGet(mouse, "Hit"), "Position") + tpoff
                        cfr = cfl(pos, pos + camcfLV * v3_101)
                        xzvel = v3_0
                        Yvel = 0
                    else
                        predictionfling()
                    end
                end
            end))
        else
            tinsert(cons, Connect(insGet(mouse, "Button1Down"), function()
                if insGet(mouse, "Target") and IsKeyDown(uis, ctrlclicktp) then
                    pos = cfGet(insGet(mouse, "Hit"), "Position") + tpoff
                    cfr = cfl(pos, pos + camcfLV * v3_101)
                    xzvel = v3_0
                    Yvel = 0
                end
            end))
        end
    elseif clickfling then
        tinsert(cons, Connect(insGet(mouse, "Button1Down"), predictionfling))
    end

    local hhOff = 3
    local hhOff1 = 3.01
    local setHipHeight = function(n)
        hhOff = n + 3
        hhOff1 = n + 3.01
    end

    local noYvelTime = 1
    local lastsine = sine
    -- Lightning state
    local lightningActive = false
    local lightningParts = nil
    local lastLightningRotate = 0

    local function destroyLightning()
        if lightningParts then
            if lightningParts.LS and lightningParts.LS.Parent then
                Destroy(lightningParts.LS)
            end
            lightningParts = nil
        end
        lightningActive = false
    end

    local function spawnLightning()
        if lightningParts then
            return
        end

        local LS = Instance.new("Part")
        LS.Name = "LightningStart"
        LS.Anchored = true
        LS.CanCollide = false
        LS.CanQuery = false
        LS.CanTouch = false
        LS.Transparency = 1
        LS.Size = Vector3.new(0.1, 0.1, 0.1)
        LS.Massless = true
        LS.Parent = ws

        local LC = Instance.new("Part")
        LC.Name = "LightningCenter"
        LC.Anchored = true
        LC.CanCollide = false
        LC.CanQuery = false
        LC.CanTouch = false
        LC.Transparency = 1
        LC.Size = Vector3.new(0.1, 0.1, 0.1)
        LC.Massless = true
        LC.Parent = LS

        local lsOrigin = cf(-51.48, 8.6, 20.74)
        local lsInv = Inverse(lsOrigin)

        local boltData = {{cf(-129.1, 8.13, 15.62, -0.97, -0.21, -0.13, 0.16, -0.93, 0.34, -0.19, 0.31, 0.93), 2, 2, 2},
                          {cf(-129.07, 7.73, 17.45, -0.98, -0.16, -0.11, -0.01, -0.5, 0.87, -0.19, 0.85, 0.48), 2, 2, 2},
                          {cf(-117.84, 8.02, 15.72, -0.97, 0.22, 0.07, -0.13, -0.78, 0.62, 0.19, 0.59, 0.79), 2, 2, 2},
                          {cf(-118.62, 8.25, 18.13, -0.97, 0.17, 0.19, 0.21, 0.08, 0.97, 0.15, 0.98, -0.12), 2, 2, 2},
                          {cf(-129.04, 10.99, 15.4, -0.92, -0.29, -0.28, -0.35, 0.27, 0.9, -0.18, 0.92, -0.35), 2, 2, 2},
                          {cf(-129.23, 10.69, 13.89, -0.97, -0.24, -0.03, -0.24, 0.96, 0.15, -0.01, 0.16, -0.99), 2, 2,
                           2},
                          {cf(-130.02, 9.5, 16.38, -0.89, -0.45, -0.07, -0, -0.16, 0.99, -0.46, 0.88, 0.14), 2, 2, 2},
                          {cf(-129.52, 10.37, 15.09, 0.9, -0.44, -0.03, 0.23, 0.51, -0.83, 0.38, 0.73, 0.56), 2, 2, 2},
                          {cf(-129.6, 9.07, 15.6, 0.9, -0.44, 0.03, 0.43, 0.87, -0.26, 0.09, 0.24, 0.97), 2, 2, 2},
                          {cf(-130.01, 9.25, 17.17, -0.91, -0.41, -0.11, -0.31, 0.46, 0.83, -0.29, 0.79, -0.54), 2, 2, 2},
                          {cf(-129.38, 8.51, 14.48, -0.96, -0.28, -0.08, -0.2, 0.82, -0.53, 0.21, -0.5, -0.84), 2, 2, 2},
                          {cf(-129.13, 9.74, 15.41, -0.91, -0.26, -0.33, -0.39, 0.81, 0.45, 0.15, 0.53, -0.83), 2, 2, 2},
                          {cf(-117.82, 7.77, 16.93, -0.96, 0.28, 0.07, 0.02, -0.2, 0.98, 0.28, 0.94, 0.18), 2, 2, 2},
                          {cf(-118.16, 9.54, 14.51, -0.97, 0.17, 0.14, 0.01, 0.66, -0.75, -0.22, -0.73, -0.64), 2, 2, 2},
                          {cf(-118.51, 9.52, 18.64, -0.97, 0.2, 0.14, 0.25, 0.71, 0.66, 0.03, 0.67, -0.74), 2, 2, 2},
                          {cf(-107.43, 7.03, 18.48, 0.96, -0.27, -0.01, -0.02, -0.06, -1, 0.27, 0.96, -0.06), 2, 2, 2},
                          {cf(-117.64, 12.27, 15.63, -0.98, 0.18, -0.03, 0.12, 0.76, 0.64, 0.13, 0.63, -0.76), 2, 2, 2},
                          {cf(-118.04, 10.96, 15.05, -0.96, 0.22, 0.17, 0.2, 0.97, -0.15, -0.2, -0.11, -0.97), 2, 2, 2},
                          {cf(-117.8, 10.92, 14.07, -0.98, 0.17, -0.08, 0.17, 0.98, -0.02, 0.08, -0.03, -1), 2, 2, 2},
                          {cf(-107.76, 8.25, 16.55, 0.93, -0.35, -0.04, -0.34, -0.84, -0.42, 0.11, 0.4, -0.91), 2, 2, 2},
                          {cf(-113.22, 11.35, 18.49, 0.99, -0.12, -0.07, -0.01, 0.47, -0.89, 0.14, 0.88, 0.46), 2, 2, 2},
                          {cf(-113.23, 12.12, 16.57, 0.99, -0.1, -0.01, 0.09, 0.93, -0.37, 0.05, 0.36, 0.93), 2, 2, 2},
                          {cf(-107.73, 8.54, 16.81, 0.95, -0.3, -0.06, -0.18, -0.37, -0.91, 0.25, 0.88, -0.41), 2, 2, 2},
                          {cf(-107.27, 8.89, 19.05, 0.97, -0.23, 0.03, 0.17, 0.59, -0.79, 0.16, 0.78, 0.61), 2, 2, 2},
                          {cf(-107.69, 11.8, 15.89, 0.99, 0.01, -0.16, -0.02, 1, -0.05, 0.16, 0.05, 0.99), 2, 2, 2},
                          {cf(-107.83, 10.79, 13.99, 0.99, -0.03, -0.12, 0.1, 0.79, 0.61, 0.07, -0.62, 0.78), 2, 2, 2},
                          {cf(-96.99, 7.7, 18.78, 0.98, 0.14, 0.17, 0.13, 0.28, -0.95, -0.18, 0.95, 0.26), 2, 2, 2},
                          {cf(-96.59, 7.08, 17.41, 0.99, 0.07, 0.11, 0.13, -0.71, -0.69, 0.03, 0.7, -0.72), 2, 2, 2},
                          {cf(-96.49, 8.28, 17.58, 0.98, 0.13, 0.11, 0.12, -0.08, -0.99, -0.12, 0.99, -0.09), 2, 2, 2},
                          {cf(-96.86, 9.66, 18.22, 0.96, 0.17, 0.22, -0.02, 0.84, -0.55, -0.28, 0.52, 0.81), 2, 2, 2},
                          {cf(-96.51, 10.17, 17.4, 0.95, 0.32, -0.02, -0.3, 0.92, 0.24, 0.1, -0.22, 0.97), 2, 2, 2},
                          {cf(-95.91, 9.41, 18.93, 0.92, 0.37, -0.09, -0.31, 0.6, -0.74, -0.22, 0.71, 0.67), 2, 2, 2},
                          {cf(-96.55, 10.61, 15.53, 0.96, 0.27, 0.01, -0.16, 0.55, 0.82, 0.22, -0.79, 0.58), 2, 2, 2},
                          {cf(-95.85, 11.04, 17.15, 0.93, 0.37, -0.03, -0.38, 0.92, -0.12, -0.01, 0.12, 0.99), 2, 2, 2},
                          {cf(-89.92, 8.39, 18.95, -0.97, -0.21, -0.13, 0.16, -0.93, 0.34, -0.19, 0.31, 0.93), 2, 2, 2},
                          {cf(-89.88, 7.98, 20.78, -0.98, -0.16, -0.11, -0.01, -0.5, 0.87, -0.19, 0.85, 0.48), 2, 2, 2},
                          {cf(-78.66, 8.28, 19.05, -0.97, 0.22, 0.07, -0.13, -0.78, 0.62, 0.19, 0.59, 0.79), 2, 2, 2},
                          {cf(-79.44, 8.51, 21.46, -0.97, 0.17, 0.19, 0.21, 0.08, 0.97, 0.15, 0.98, -0.12), 2, 2, 2},
                          {cf(-89.86, 11.24, 18.73, -0.92, -0.29, -0.28, -0.35, 0.27, 0.9, -0.18, 0.92, -0.35), 2, 2, 2},
                          {cf(-90.05, 10.94, 17.22, -0.97, -0.24, -0.03, -0.24, 0.96, 0.15, -0.01, 0.16, -0.99), 2, 2, 2},
                          {cf(-90.84, 9.76, 19.7, -0.89, -0.45, -0.07, -0, -0.16, 0.99, -0.46, 0.88, 0.14), 2, 2, 2},
                          {cf(-90.34, 10.63, 18.42, 0.9, -0.44, -0.03, 0.23, 0.51, -0.83, 0.38, 0.73, 0.56), 2, 2, 2},
                          {cf(-90.42, 9.32, 18.93, 0.9, -0.44, 0.03, 0.43, 0.87, -0.26, 0.09, 0.24, 0.97), 2, 2, 2},
                          {cf(-90.83, 9.51, 20.5, -0.91, -0.41, -0.11, -0.31, 0.46, 0.83, -0.29, 0.79, -0.54), 2, 2, 2},
                          {cf(-90.19, 8.77, 17.8, -0.96, -0.28, -0.08, -0.2, 0.82, -0.53, 0.21, -0.5, -0.84), 2, 2, 2},
                          {cf(-89.95, 9.99, 18.74, -0.91, -0.26, -0.33, -0.39, 0.81, 0.45, 0.15, 0.53, -0.83), 2, 2, 2},
                          {cf(-78.63, 8.03, 20.26, -0.96, 0.28, 0.07, 0.02, -0.2, 0.98, 0.28, 0.94, 0.18), 2, 2, 2},
                          {cf(-78.98, 9.8, 17.84, -0.97, 0.17, 0.14, 0.01, 0.66, -0.75, -0.22, -0.73, -0.64), 2, 2, 2},
                          {cf(-79.32, 9.78, 21.97, -0.97, 0.2, 0.14, 0.25, 0.71, 0.66, 0.03, 0.67, -0.74), 2, 2, 2},
                          {cf(-68.24, 7.28, 21.81, 0.96, -0.27, -0.01, -0.02, -0.06, -1, 0.27, 0.96, -0.06), 2, 2, 2},
                          {cf(-78.46, 12.53, 18.96, -0.98, 0.18, -0.03, 0.12, 0.76, 0.64, 0.13, 0.63, -0.76), 2, 2, 2},
                          {cf(-78.85, 11.21, 18.38, -0.96, 0.22, 0.17, 0.2, 0.97, -0.15, -0.2, -0.11, -0.97), 2, 2, 2},
                          {cf(-78.62, 11.17, 17.4, -0.98, 0.17, -0.08, 0.17, 0.98, -0.02, 0.08, -0.03, -1), 2, 2, 2},
                          {cf(-68.57, 8.51, 19.87, 0.93, -0.35, -0.04, -0.34, -0.84, -0.42, 0.11, 0.4, -0.91), 2, 2, 2},
                          {cf(-74.04, 11.6, 21.82, 0.99, -0.12, -0.07, -0.01, 0.47, -0.89, 0.14, 0.88, 0.46), 2, 2, 2},
                          {cf(-74.05, 12.38, 19.9, 0.99, -0.1, -0.01, 0.09, 0.93, -0.37, 0.05, 0.36, 0.93), 2, 2, 2},
                          {cf(-68.54, 8.8, 20.14, 0.95, -0.3, -0.06, -0.18, -0.37, -0.91, 0.25, 0.88, -0.41), 2, 2, 2},
                          {cf(-68.08, 9.15, 22.38, 0.97, -0.23, 0.03, 0.17, 0.59, -0.79, 0.16, 0.78, 0.61), 2, 2, 2},
                          {cf(-68.5, 12.05, 19.22, 0.99, 0.01, -0.16, -0.02, 1, -0.05, 0.16, 0.05, 0.99), 2, 2, 2},
                          {cf(-68.65, 11.04, 17.32, 0.99, -0.03, -0.12, 0.1, 0.79, 0.61, 0.07, -0.62, 0.78), 2, 2, 2},
                          {cf(-57.81, 7.96, 22.11, 0.98, 0.14, 0.17, 0.13, 0.28, -0.95, -0.18, 0.95, 0.26), 2, 2, 2},
                          {cf(-57.41, 7.33, 20.74, 0.99, 0.07, 0.11, 0.13, -0.71, -0.69, 0.03, 0.7, -0.72), 2, 2, 2},
                          {cf(-57.31, 8.54, 20.9, 0.98, 0.13, 0.11, 0.12, -0.08, -0.99, -0.12, 0.99, -0.09), 2, 2, 2},
                          {cf(-57.68, 9.91, 21.55, 0.96, 0.17, 0.22, -0.02, 0.84, -0.55, -0.28, 0.52, 0.81), 2, 2, 2},
                          {cf(-57.33, 10.43, 20.73, 0.95, 0.32, -0.02, -0.3, 0.92, 0.24, 0.1, -0.22, 0.97), 2, 2, 2},
                          {cf(-56.72, 9.66, 22.26, 0.92, 0.37, -0.09, -0.31, 0.6, -0.74, -0.22, 0.71, 0.67), 2, 2, 2},
                          {cf(-57.37, 10.86, 18.86, 0.96, 0.27, 0.01, -0.16, 0.55, 0.82, 0.22, -0.79, 0.58), 2, 2, 2},
                          {cf(-56.66, 11.3, 20.48, 0.93, 0.37, -0.03, -0.38, 0.92, -0.12, -0.01, 0.12, 0.99), 2, 2, 2}}

        local bolts = {}
        for idx, data in ipairs(boltData) do
            local bolt = Instance.new("Part")
            bolt.Anchored = true
            bolt.CanCollide = false
            bolt.CanQuery = false
            bolt.CanTouch = false
            bolt.Material = Enum.Material.Neon
            bolt.Transparency = 0.3
            bolt.Color = Color3.fromRGB(180, 170, 255)
            bolt.Massless = true

            local nextData = boltData[idx + 1]
            local thisCF = data[1]
            local relCF
            if nextData then
                local thisPos = thisCF.Position
                local nextPos = nextData[1].Position
                local dist = (nextPos - thisPos).Magnitude
                bolt.Size = Vector3.new(0.2, 0.2, dist)
                relCF = lsInv * CFrame.lookAt(thisPos + (nextPos - thisPos) * 0.5, nextPos)
            else
                bolt.Size = Vector3.new(0.2, 0.2, 3)
                relCF = lsInv * thisCF
            end

            bolt:SetAttribute("RelCFrame", relCF)
            bolt.Parent = LC
            tinsert(bolts, bolt)
        end

        lightningParts = {
            LS = LS,
            LC = LC,
            bolts = bolts
        }
    end

    -- Lightning heartbeat
    tinsert(cons, Connect(heartbeat, function()
        if not lightningActive or not lightningParts then
            return
        end
        if not c then
            destroyLightning()
            return
        end

        local rightArmPart = getPart("Right Arm")
        if not rightArmPart then
            return
        end

        local armCF = cframes[rightArmPart]
        if not armCF then
            return
        end

        local gunTipCF = cfMul(armCF, cf(1, 0.5, 0)) * angles(rad(100), rad(90), 0)
        lightningParts.LS.CFrame = gunTipCF

        local now = osclock()
        if now - lastLightningRotate >= 0.1 then
            lastLightningRotate = now
            local randX = mrandom(0, 628) / 100
            local lcCF = cfMul(gunTipCF, angles(randX, 0, 0))
            lightningParts.LC.CFrame = lcCF

            for _, bolt in ipairs(lightningParts.bolts) do
                local relCF = bolt:GetAttribute("RelCFrame")
                if relCF then
                    bolt.CFrame = cfMul(lcCF, relCF)
                end
            end
        end
    end))

    -- Hat Trail heartbeat
    local hatTrailFadeDuration = 0.6
    local hatTrailQueue = {}

    tinsert(cons, Connect(heartbeat, function()
        local now = osclock()
        local i = 1
        while i <= #hatTrailQueue do
            local entry = hatTrailQueue[i]
            local progress = (now - entry.startTime) / entry.fadeDuration
            if progress >= 1 then
                if entry.clone and entry.clone.Parent then
                    Destroy(entry.clone)
                end
                table.remove(hatTrailQueue, i)
            else
                insSet(entry.clone, "Transparency", entry.startTransparency + (1 - entry.startTransparency) * progress)
                i = i + 1
            end
        end
    end))

    local function spawnHatTrail(fadeDuration, startAlpha)
        fadeDuration = fadeDuration or 0.6
        startAlpha = startAlpha or 0.3

        for partTable, partCF in next, cframes do
            local realPart = partTable.p
            if realPart and partTable.m then
                local ok, clone = pcall(Clone, realPart)

                if ok and clone then
                    local mesh = FindFirstChildOfClass(clone, "SpecialMesh")
                    pcall(ClearAllChildren, clone)
                    if mesh then
                        pcall(function()
                            insSet(mesh, "TextureId", "")
                            insSet(mesh, "Parent", clone)
                        end)
                    end

                    insSet(clone, "Anchored", true)
                    insSet(clone, "CanCollide", false)
                    insSet(clone, "CanQuery", false)
                    insSet(clone, "CanTouch", false)
                    insSet(clone, "CastShadow", false)
                    insSet(clone, "Color", c3(1, 1, 1))
                    insSet(clone, "Material", e.Material.SmoothPlastic)
                    insSet(clone, "Transparency", startAlpha)
                    insSet(clone, "CFrame", partCF)
                    insSet(clone, "Name", "HatTrailClone")
                    insSet(clone, "Archivable", false)
                    insSet(clone, "Parent", ws)

                    tinsert(hatTrailQueue, {
                        clone = clone,
                        startTime = osclock(),
                        startTransparency = startAlpha,
                        fadeDuration = fadeDuration
                    })
                end
            end
        end
    end

    -- Attack system
    local attackActive = false
    local attackProgress = 0
    local attackDuration = 0.45
    local currentAttackMode = nil
    local currentAttackKey = nil

    local attacks = {}

    local function registerAttack(modeName, keyName, fn)
        if not attacks[modeName] then
            attacks[modeName] = {}
        end
        attacks[modeName][keyName] = fn
    end

    local function fireAttack(modeName, keyName)
        local modeAttacks = attacks[modeName]
        if not modeAttacks then
            return
        end
        local attackDef = modeAttacks[keyName]
        if not attackDef then
            return
        end
        attackActive = true
        attackProgress = 0
        attackDuration = attackDef.duration or 0.45
        currentAttackMode = modeName
        currentAttackKey = keyName
    end

    local mainFunction = function()

        sine = osclock()
        local delta = sine - lastsine
        deltaTime = min(delta * 10, 1)
        lastsine = sine

        if shiftlock then
            if allowshiftlock then
                if mouseBehavior ~= enumMLC then
                    mouseBehavior = enumMLC
                    insSet(uis, "MouseBehavior", mouseBehavior)
                end
                mouseCameraMove = true
            else
                shiftlock = false
            end
        elseif firstperson then
            if mouseBehavior ~= enumMLC then
                mouseBehavior = enumMLC
                insSet(uis, "MouseBehavior", mouseBehavior)
            end
            mouseCameraMove = true
        elseif IsMouseButtonPressed(uis, enumMB2) then
            if mouseBehavior ~= enumMLCP then
                mouseBehavior = enumMLCP
                insSet(uis, "MouseBehavior", mouseBehavior)
            end
            mouseCameraMove = true
        else
            if mouseBehavior ~= enumMD then
                mouseBehavior = enumMD
                insSet(uis, "MouseBehavior", mouseBehavior)
            end
            mouseCameraMove = false
        end

        local raycastresult = Raycast(ws, pos, v3_010 * (fpdh - v3Get(pos, "Y")), raycastparams)
        local onground = nil
        if raycastresult then
            onground = raycastresult.Distance < hhOff1
            if onground then
                Yvel = 0
                pos = pos + v3_010 * (v3Get(raycastresult.Position, "Y") + hhOff - v3Get(pos, "Y")) * min(delta * 20, 1)
                if jumpingInput and (jumpPower > 0) then
                    Yvel = jumpPower
                    onground = false
                end
            else
                Yvel = Yvel - gravity * delta
                raycastresult = v3Get(raycastresult.Position, "Y")
                if v3Get(pos, "Y") + Yvel * delta < raycastresult then
                    Yvel = 0
                    pos = pos + v3_010 * (raycastresult + hhOff - v3Get(pos, "Y"))
                end
            end
        else
            Yvel = 0
            onground = false
        end

        if firstperson then
            if isWalking then
                if walkSpeed == 0 then
                    xzvel = v3_0
                    if onground then
                        cfr = cfl(pos, pos + camcfLV * v3_101)
                        camcf = cfAdd(camrot, pos + v3_0150)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsIdle()
                        end
                        noYvelTime = min(noYvelTime + delta * 0.3, 1)
                        if not attackActive then
                            xzvel = xzvel * (1 - noYvelTime)
                        end
                    elseif Yvel > 0 then
                        pos = pos + v3_010 * Yvel * delta
                        cfr = cfl(pos, pos + camcfLV * v3_101)
                        camcf = cfAdd(camrot, pos + v3_0150)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsJump()
                        end
                        noYvelTime = 0
                    else
                        pos = pos + v3_010 * Yvel * delta
                        cfr = cfl(pos, pos + camcfLV * v3_101)
                        camcf = cfAdd(camrot, pos + v3_0150)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsFall()
                        end
                        noYvelTime = 0
                    end
                else
                    xzvel = vnormalize(vnormalize(camcfLV * v3_101) * FWmovement + vnormalize(camcfRV * v3_101) *
                                           RTmovement) * walkSpeed
                    if onground then
                        pos = pos + xzvel * delta
                        cfr = cfl(pos, pos + camcfLV * v3_101)
                        camcf = cfAdd(camrot, pos + v3_0150)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsWalk()
                        end
                        noYvelTime = min(noYvelTime + delta * 0.3, 1)
                        if not attackActive then
                            xzvel = xzvel * (1 - noYvelTime)
                        end
                    elseif Yvel > 0 then
                        pos = pos + (xzvel + v3_010 * Yvel) * delta
                        cfr = cfl(pos, pos + camcfLV * v3_101)
                        camcf = cfAdd(camrot, pos + v3_0150)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsJump()
                        end
                        noYvelTime = 0
                    else
                        pos = pos + (xzvel + v3_010 * Yvel) * delta
                        cfr = cfl(pos, pos + camcfLV * v3_101)
                        camcf = cfAdd(camrot, pos + v3_0150)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsFall()
                        end
                        noYvelTime = 0
                    end
                end
            else
                xzvel = v3_0
                if onground then
                    cfr = cfl(pos, pos + camcfLV * v3_101)
                    camcf = cfAdd(camrot, pos + v3_0150)
                    cframes[rootpart] = cfr
                    insSet(cam, "CFrame", camcf)
                    if not attackActive then
                        lerpsIdle()
                    end
                    noYvelTime = min(noYvelTime + delta * 0.3, 1)
                    if not attackActive then
                        xzvel = xzvel * (1 - noYvelTime)
                    end
                elseif Yvel > 0 then
                    pos = pos + v3_010 * Yvel * delta
                    cfr = cfl(pos, pos + camcfLV * v3_101)
                    camcf = cfAdd(camrot, pos + v3_0150)
                    cframes[rootpart] = cfr
                    insSet(cam, "CFrame", camcf)
                    if not attackActive then
                        lerpsJump()
                    end
                    noYvelTime = 0
                else
                    pos = pos + v3_010 * Yvel * delta
                    cfr = cfl(pos, pos + camcfLV * v3_101)
                    camcf = cfAdd(camrot, pos + v3_0150)
                    cframes[rootpart] = cfr
                    insSet(cam, "CFrame", camcf)
                    if not attackActive then
                        lerpsFall()
                    end
                    noYvelTime = 0
                end
            end
        elseif shiftlock then
            if isWalking then
                if walkSpeed == 0 then
                    xzvel = v3_0
                    if onground then
                        cfr = cfl(pos, pos + camcfLV * v3_101)
                        camcf = cfAdd(camrot, pos + v3_0150 + camcfRV * 1.75 + camcfLV * cammag)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsIdle()
                        end
                        noYvelTime = min(noYvelTime + delta * 0.3, 1)
                        if not attackActive then
                            xzvel = xzvel * (1 - noYvelTime)
                        end
                    elseif Yvel > 0 then
                        pos = pos + v3_010 * Yvel * delta
                        cfr = cfl(pos, pos + camcfLV * v3_101)
                        camcf = cfAdd(camrot, pos + v3_0150 + camcfRV * 1.75 + camcfLV * cammag)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsJump()
                        end
                        noYvelTime = 0
                    else
                        pos = pos + v3_010 * Yvel * delta
                        cfr = cfl(pos, pos + camcfLV * v3_101)
                        camcf = cfAdd(camrot, pos + v3_0150 + camcfRV * 1.75 + camcfLV * cammag)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsFall()
                        end
                        noYvelTime = 0
                    end
                else
                    xzvel = vnormalize(vnormalize(camcfLV * v3_101) * FWmovement + vnormalize(camcfRV * v3_101) *
                                           RTmovement) * walkSpeed
                    if onground then
                        pos = pos + xzvel * delta
                        cfr = cfl(pos, pos + camcfLV * v3_101)
                        camcf = cfAdd(camrot, pos + v3_0150 + camcfRV * 1.75 + camcfLV * cammag)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsWalk()
                        end
                        noYvelTime = min(noYvelTime + delta * 0.3, 1)
                        if not attackActive then
                            xzvel = xzvel * (1 - noYvelTime)
                        end
                    elseif Yvel > 0 then
                        pos = pos + (xzvel + v3_010 * Yvel) * delta
                        cfr = cfl(pos, pos + camcfLV * v3_101)
                        camcf = cfAdd(camrot, pos + v3_0150 + camcfRV * 1.75 + camcfLV * cammag)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsJump()
                        end
                        noYvelTime = 0
                    else
                        pos = pos + (xzvel + v3_010 * Yvel) * delta
                        cfr = cfl(pos, pos + camcfLV * v3_101)
                        camcf = cfAdd(camrot, pos + v3_0150 + camcfRV * 1.75 + camcfLV * cammag)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsFall()
                        end
                        noYvelTime = 0
                    end
                end
            else
                xzvel = v3_0
                if onground then
                    cfr = cfl(pos, pos + camcfLV * v3_101)
                    camcf = cfAdd(camrot, pos + v3_0150 + camcfRV * 1.75 + camcfLV * cammag)
                    cframes[rootpart] = cfr
                    insSet(cam, "CFrame", camcf)
                    if not attackActive then
                        lerpsIdle()
                    end
                    noYvelTime = min(noYvelTime + delta * 0.3, 1)
                    if not attackActive then
                        xzvel = xzvel * (1 - noYvelTime)
                    end
                elseif Yvel > 0 then
                    pos = pos + v3_010 * Yvel * delta
                    cfr = cfl(pos, pos + camcfLV * v3_101)
                    camcf = cfAdd(camrot, pos + v3_0150 + camcfRV * 1.75 + camcfLV * cammag)
                    cframes[rootpart] = cfr
                    insSet(cam, "CFrame", camcf)
                    if not attackActive then
                        lerpsJump()
                    end
                    noYvelTime = 0
                else
                    pos = pos + v3_010 * Yvel * delta
                    cfr = cfl(pos, pos + camcfLV * v3_101)
                    camcf = cfAdd(camrot, pos + v3_0150 + camcfRV * 1.75 + camcfLV * cammag)
                    cframes[rootpart] = cfr
                    insSet(cam, "CFrame", camcf)
                    if not attackActive then
                        lerpsFall()
                    end
                    noYvelTime = 0
                end
            end
        else
            if isWalking then
                if walkSpeed == 0 then
                    xzvel = v3_0
                    if onground then
                        cfr = cfAdd(cfGet(cfr, "Rotation"), pos)
                        camcf = cfAdd(camrot, pos + v3_0150 + camcfLV * cammag)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsIdle()
                        end
                        noYvelTime = min(noYvelTime + delta * 0.3, 1)
                        if not attackActive then
                            xzvel = xzvel * (1 - noYvelTime)
                        end
                    elseif Yvel > 0 then
                        pos = pos + v3_010 * Yvel * delta
                        cfr = cfAdd(cfGet(cfr, "Rotation"), pos)
                        camcf = cfAdd(camrot, pos + v3_0150 + camcfLV * cammag)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsJump()
                        end
                        noYvelTime = 0
                    else
                        pos = pos + v3_010 * Yvel * delta
                        cfr = cfAdd(cfGet(cfr, "Rotation"), pos)
                        camcf = cfAdd(camrot, pos + v3_0150 + camcfLV * cammag)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsFall()
                        end
                        noYvelTime = 0
                    end
                else
                    xzvel = vnormalize(vnormalize(camcfLV * v3_101) * FWmovement + vnormalize(camcfRV * v3_101) *
                                           RTmovement) * walkSpeed
                    if onground then
                        pos = pos + xzvel * delta
                        cfr = cfAdd(Lerp(cfGet(cfr, "Rotation"), cfl(v3_0, xzvel), deltaTime), pos)
                        camcf = cfAdd(camrot, pos + v3_0150 + camcfLV * cammag)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsWalk()
                        end
                        noYvelTime = min(noYvelTime + delta * 0.3, 1)
                        if not attackActive then
                            xzvel = xzvel * (1 - noYvelTime)
                        end
                    elseif Yvel > 0 then
                        pos = pos + (xzvel + (v3_010 * Yvel)) * delta
                        cfr = cfAdd(Lerp(cfGet(cfr, "Rotation"), cfl(v3_0, xzvel), deltaTime), pos)
                        camcf = cfAdd(camrot, pos + v3_0150 + camcfLV * cammag)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsJump()
                        end
                        noYvelTime = 0
                    else
                        pos = pos + (xzvel + (v3_010 * Yvel)) * delta
                        cfr = cfAdd(Lerp(cfGet(cfr, "Rotation"), cfl(v3_0, xzvel), deltaTime), pos)
                        camcf = cfAdd(camrot, pos + v3_0150 + camcfLV * cammag)
                        cframes[rootpart] = cfr
                        insSet(cam, "CFrame", camcf)
                        if not attackActive then
                            lerpsFall()
                        end
                        noYvelTime = 0
                    end
                end
            else
                xzvel = v3_0
                if onground then
                    cfr = cfAdd(cfGet(cfr, "Rotation"), pos)
                    camcf = cfAdd(camrot, pos + v3_0150 + camcfLV * cammag)
                    cframes[rootpart] = cfr
                    insSet(cam, "CFrame", camcf)
                    if not attackActive then
                        lerpsIdle()
                    end
                    noYvelTime = min(noYvelTime + delta * 0.3, 1)
                    if not attackActive then
                        xzvel = xzvel * (1 - noYvelTime)
                    end
                elseif Yvel > 0 then
                    pos = pos + v3_010 * Yvel * delta
                    cfr = cfAdd(cfGet(cfr, "Rotation"), pos)
                    camcf = cfAdd(camrot, pos + v3_0150 + camcfLV * cammag)
                    cframes[rootpart] = cfr
                    insSet(cam, "CFrame", camcf)
                    if not attackActive then
                        lerpsJump()
                    end
                    noYvelTime = 0
                else
                    pos = pos + v3_010 * Yvel * delta
                    cfr = cfAdd(cfGet(cfr, "Rotation"), pos)
                    camcf = cfAdd(camrot, pos + v3_0150 + camcfLV * cammag)
                    cframes[rootpart] = cfr
                    insSet(cam, "CFrame", camcf)
                    if not attackActive then
                        lerpsFall()
                    end
                    noYvelTime = 0
                end
            end
        end

        refreshjointsI(rootpart)
        tclear(refreshedjoints)

        local sine15 = sine * 15
        local idlerv = v3(sin(sine15), sin(sine15 + 1.0471975511965976), sin(sine15 + 2.0943951023931953))
        local idleoff = idlerv * 0.003910064697265625

        local claimpos = insGet(primarypart, "Position")
        local claimposY = v3Get(claimpos, "Y")
        for i, v in next, cframes do
            local part = i.p

            if part then
                if insGet(part, "ReceiveAge") == 0 then
                    local placeholder = i.v
                    local vpos = cfGet(v, "Position")
                    if novoid and (v3Get(vpos, "Y") < novoid) then
                        v = cfAdd(v, v3_010 * (novoid - v3Get(vpos, "Y")))
                    end
                    local lastpos = i.l
                    local vel = (vpos - lastpos) / delta
                    local mag = vmagnitude(vel)
                    if mag < 0.11730194091796875 then
                        if placeholder and i.b then
                            insSet(placeholder, "Parent", nil)
                            i.b = false
                        end
                        i.l = cfGet(v, "Position")
                        v = cfAdd(v, idleoff)
                    elseif mag > speedlimit then
                        if placeholder then
                            insSet(placeholder, "CFrame", v)
                            if not i.b then
                                insSet(placeholder, "Parent", ws)
                                i.b = true
                            end
                        end
                        vel = vnormalize(vel) * speedlimit
                        local newpos = lastpos + vel * delta
                        v = cfAdd(cfGet(v, "Rotation"), newpos)
                        i.l = newpos
                    else
                        if placeholder and i.b then
                            insSet(placeholder, "Parent", nil)
                            i.b = false
                        end
                        i.l = cfGet(v, "Position")
                    end
                    local claimtime = i.c
                    if claimtime then
                        if sine - claimtime < retVelTime then
                            local Ydiff = cfGet(v, "Y") - claimposY
                            local velY = 25.01
                            local fallingTime = 0
                            while (Ydiff > 0) or (velY > 0) do
                                fallingTime = fallingTime + 0.025
                                if fallingTime > 0.6 then
                                    break
                                end
                                velY = velY - velYdelta
                                Ydiff = Ydiff + (velY * 0.025)
                            end
                            insSet(part, "AssemblyLinearVelocity",
                                (claimpos - cfGet(v, "Position")) * v3_101 / fallingTime + v3_net)
                        else
                            local vel1 = vel * noYvelTime + xzvel
                            if vmagnitude(vel1) > 25.01 then
                                insSet(part, "AssemblyLinearVelocity", vnormalize(vel1) * v3_xzL + v3_net)
                            else
                                insSet(part, "AssemblyLinearVelocity", vel1 * v3_xz + v3_net)
                            end
                        end
                    else
                        i.c = sine
                        local vel1 = vel * noYvelTime + xzvel
                        if vmagnitude(vel1) > 25.01 then
                            insSet(part, "AssemblyLinearVelocity", vnormalize(vel1) * v3_xzL + v3_net)
                        else
                            insSet(part, "AssemblyLinearVelocity", vel1 * v3_xz + v3_net)
                        end
                    end
                    insSet(part, "CFrame", v)
                    insSet(part, "AssemblyAngularVelocity", idlerv)
                else
                    i.c = nil
                    i.l = insGet(part, "Position")
                    local placeholder = i.v
                    if placeholder then
                        insSet(placeholder, "CFrame", v)
                        if not i.b then
                            insSet(placeholder, "Parent", ws)
                            i.b = true
                        end
                    end
                end
            else
                local placeholder = i.v
                if placeholder then
                    insSet(placeholder, "CFrame", v)
                    if not i.b then
                        insSet(placeholder, "Parent", ws)
                        i.b = true
                    end
                end
            end
        end
        if attackActive then
            attackProgress = attackProgress + delta / attackDuration
            if attackProgress >= 1 then
                attackProgress = 1
                attackActive = false
                if lightningActive then
                    destroyLightning()
                end
            else
                local modeAttacks = attacks[currentAttackMode]
                if modeAttacks then
                    local attackDef = modeAttacks[currentAttackKey]
                    if attackDef and attackDef.fn then
                        attackDef.fn()
                    end
                end
            end
        end
        setsimrad()
    end

    sine = osclock()
    lastsine = sine
    tinsert(cons, Connect(heartbeat, mainFunction))
    mainFunction()

    local refreshjoints = function(v)
        refreshjointsI(v)
        tclear(refreshedjoints)
    end

    local legcfR = cf(1, -1, 0)
    local legcfL = cf(-1, -1, 0)
    local raydir = v3_010 * -2
    local raycastlegs = function()
        local rY = Raycast(ws, cfGet(cfMul(cfr, legcfR), "Position"), raydir, raycastparams)
        local lY = Raycast(ws, cfGet(cfMul(cfr, legcfL), "Position"), raydir, raycastparams)
        if rY then
            if lY then
                return v3Get(rY.Position, "Y") - (v3Get(pos, "Y") - 3), v3Get(lY.Position, "Y") - (v3Get(pos, "Y") - 3)
            else
                return v3Get(rY.Position, "Y") - (v3Get(pos, "Y") - 3), 0
            end
        elseif lY then
            return 0, v3Get(lY.Position, "Y") - (v3Get(pos, "Y") - 3)
        else
            return 0, 0
        end
    end

    local velbycfrvec = function()
        local fw = cfGet(cfr, "LookVector") * xzvel / walkSpeed
        local rt = cfGet(cfr, "RightVector") * xzvel / walkSpeed
        return v3Get(fw, "X") + v3Get(fw, "Z"), v3Get(rt, "X") + v3Get(rt, "Z")
    end

    local lastvel = v3_0
    local velchg1 = v3_0
    local velchgbycfrvec = function()
        velchg1 = velchg1 + (lastvel - xzvel)
        lastvel = xzvel
        velchg1 = velchg1 - velchg1 * (deltaTime / 2)
        local fw = cfGet(cfr, "LookVector") * velchg1 / 32
        local rt = cfGet(cfr, "RightVector") * velchg1 / 32
        return v3Get(fw, "X") + v3Get(fw, "Z"), v3Get(rt, "X") + v3Get(rt, "Z")
    end

    local lastYvel = 0
    local velYchg1 = 0
    local velYchg = function()
        velYchg1 = clamp(velYchg1 + (lastYvel - Yvel), -50, 50)
        lastYvel = Yvel
        velYchg1 = velYchg1 - velYchg1 * (deltaTime / 2)
        return velYchg1
    end

    local rotToMouse = function(alpha)
        local pos1 = pos * v3_010 + cfGet(insGet(mouse, "Hit"), "Position") * v3_101
        if pos ~= pos1 then
            cfr = Lerp(cfr, cfl(pos, pos1), alpha or deltaTime)
        end
    end

    local glitchJoint = function(joint, targetGlitchTime, delayFrom, delayTo, radiansFrom, radiansTo)
        if sine > targetGlitchTime then
            radiansFrom = radiansFrom * 100
            radiansTo = radiansTo * 100
            joint.C0 = cfMul(joint.C0,
                angles(mrandom(radiansFrom, radiansTo) / 100, mrandom(radiansFrom, radiansTo) / 100,
                    mrandom(radiansFrom, radiansTo) / 100))
            return sine + mrandom(delayFrom * 100, delayTo * 100) / 100
        end
        return targetGlitchTime
    end

    local setWalkSpeed = function(n)
        if type(n) ~= "number" then
            n = 16
        end
        walkSpeed = n
    end
    local setJumpPower = function(n)
        if type(n) ~= "number" then
            n = 50
        end
        jumpPower = n
    end
    local setGravity = function(n)
        if type(n) ~= "number" then
            n = 196.2
        end
        gravity = n
    end
    local setCfr = function(v)
        if typeof(v) == "CFrame" then
            local newpos = cfGet(v, "Position")
            camcf = cfAdd(camcf, newpos - pos)
            insSet(cam, "CFrame", camcf)
            cfr = v
            pos = newpos
        elseif typeof(v) == "Vector3" then
            camcf = cfAdd(camcf, v - pos)
            insSet(cam, "CFrame", camcf)
            cfr = cfAdd(cfGet(cfr, "Rotation"), v)
            pos = v
        end
    end
    local getVel = function()
        return xzvel + v3_010 * Yvel
    end
    local getCamCF = function()
        return camcf
    end
    local isFirstPerson = function()
        return firstperson
    end

    local function mouseTp()
        local hit = insGet(mouse, "Hit")
        if not hit then
            return
        end

        local originPos = cfGet(cfr, "Position")
        local destPos = cfGet(hit, "Position") + v3_010 * 3

        local function makeBurst(atPos, delay)
            local part = Instance.new("Part")
            part.Anchored = true
            part.CanCollide = false
            part.CanQuery = false
            part.CanTouch = false
            part.CastShadow = false
            part.Color = Color3.fromRGB(255, 255, 255)
            part.Material = Enum.Material.SmoothPlastic
            part.Size = Vector3.new(2, 2, 2)
            part.Transparency = 0.6
            part.Massless = true
            part.CFrame = CFrame.new(atPos) *
                              CFrame.fromEulerAngles(math.random(0, 628) / 100, math.random(0, 628) / 100,
                    math.random(0, 628) / 100)
            part.Parent = ws

            local rx = (math.random(80, 200)) * (math.pi / 180)
            local ry = (math.random(80, 200)) * (math.pi / 180)
            local rz = (math.random(80, 200)) * (math.pi / 180)

            task.delay(delay, function()
                local startTime = os.clock()
                local growDuration = 1.0
                local fadeDuration = 0.12

                local growConn
                growConn = game:GetService("RunService").Heartbeat:Connect(function(dt)
                    if not part.Parent then
                        growConn:Disconnect()
                        return
                    end
                    local elapsed = os.clock() - startTime
                    local t = math.min(elapsed / growDuration, 1)
                    local s = 2 + (10 - 2) * t
                    part.Size = Vector3.new(s, s, s)
                    part.CFrame = part.CFrame * CFrame.fromEulerAngles(rx * dt, ry * dt, rz * dt)
                    if t >= 1 then
                        growConn:Disconnect()
                        local fadeStart = os.clock()
                        local fadeConn
                        fadeConn = game:GetService("RunService").Heartbeat:Connect(function(dt)
                            if not part.Parent then
                                fadeConn:Disconnect()
                                return
                            end
                            local fp = math.min((os.clock() - fadeStart) / fadeDuration, 1)
                            part.Transparency = 0.6 + (1 - 0.6) * fp
                            part.CFrame = part.CFrame * CFrame.fromEulerAngles(rx * dt, ry * dt, rz * dt)
                            if fp >= 1 then
                                fadeConn:Disconnect()
                                part:Destroy()
                            end
                        end)
                    end
                end)
            end)
        end

        local function makeLine(from, to)
            local midpoint = (from + to) * 0.5
            local length = (to - from).Magnitude
            if length < 0.1 then
                return
            end

            local part = Instance.new("Part")
            part.Anchored = true
            part.CanCollide = false
            part.CanQuery = false
            part.CanTouch = false
            part.CastShadow = false
            part.Color = Color3.fromRGB(255, 255, 255)
            part.Material = Enum.Material.Neon
            part.Transparency = 0
            part.Massless = true
            part.Size = Vector3.new(0.15, 0.15, 2)
            part.CFrame = CFrame.lookAt(midpoint, to)
            part.Parent = ws

            local targetLength = length
            local startTime = os.clock()
            local growDur = 0.15
            local holdDur = 0.9
            local fadeDur = 0.12

            local conn
            conn = game:GetService("RunService").Heartbeat:Connect(function()
                if not part.Parent then
                    conn:Disconnect()
                    return
                end
                local elapsed = os.clock() - startTime

                if elapsed < growDur then
                    local t = elapsed / growDur
                    local l = 2 + (targetLength - 2) * t
                    part.Size = Vector3.new(1, 1, l)
                    part.CFrame = CFrame.lookAt(midpoint, to)
                elseif elapsed < growDur + holdDur then
                    part.Size = Vector3.new(1, 1, targetLength)
                    part.CFrame = CFrame.lookAt(midpoint, to)
                else
                    local fp = math.min((elapsed - growDur - holdDur) / fadeDur, 1)
                    part.Transparency = fp
                    if fp >= 1 then
                        conn:Disconnect()
                        part:Destroy()
                    end
                end
            end)
        end

        for i = 1, 6 do
            local delay = math.random(0, 150) / 1000
            makeBurst(originPos, delay)
        end

        setCfr(destPos)

        for i = 1, 6 do
            local delay = math.random(0, 150) / 1000
            makeBurst(destPos, delay)
        end

        makeLine(originPos, destPos)
    end

    local function shootLine(from, to)
        local length = (to - from).Magnitude
        if length < 0.1 then
            return
        end
        local midpoint = (from + to) * 0.5
        local part = Instance.new("Part")
        part.Anchored = true
        part.CanCollide = false
        part.CanQuery = false
        part.CanTouch = false
        part.CastShadow = false
        part.Color = Color3.fromRGB(255, 255, 255)
        part.Material = Enum.Material.Neon
        part.Transparency = 0
        part.Massless = true
        part.Size = Vector3.new(0.4, 0.4, 2)
        part.CFrame = CFrame.lookAt(midpoint, to)
        part.Parent = ws
        local startTime = os.clock()
        local growDur = 0.1
        local holdDur = 0.15
        local fadeDur = 0.1
        local conn
        conn = game:GetService("RunService").Heartbeat:Connect(function()
            if not part.Parent then
                conn:Disconnect()
                return
            end
            local elapsed = os.clock() - startTime
            if elapsed < growDur then
                local t = elapsed / growDur
                part.Size = Vector3.new(0.4, 0.4, 2 + (length - 2) * t)
                part.CFrame = CFrame.lookAt(midpoint, to)
            elseif elapsed < growDur + holdDur then
                part.Size = Vector3.new(0.4, 0.4, length)
                part.CFrame = CFrame.lookAt(midpoint, to)
            else
                local fp = math.min((elapsed - growDur - holdDur) / fadeDur, 1)
                part.Transparency = fp
                if fp >= 1 then
                    conn:Disconnect()
                    part:Destroy()
                end
            end
        end)
    end

    local brokenParts = {}

    local function breakPart(targetPart)
        if not targetPart then
            return false
        end
        if not IsA(targetPart, "BasePart") then
            return false
        end
        if IsDescendantOf(targetPart, c) then
            return false
        end
        if brokenParts[targetPart] then
            return false
        end
        if not IsDescendantOf(targetPart, ws) then
            return false
        end

        local maxDimension = math.max(targetPart.Size.X, targetPart.Size.Y, targetPart.Size.Z)

        if maxDimension > 500 then
            return false
        end

        brokenParts[targetPart] = true

        local originalTransparency = targetPart.Transparency
        pcall(function()
            targetPart.Transparency = 0.5
        end)

        local partPos = targetPart.Position
        for cloneIdx = 1, 4 do
            task.spawn(function()
                local delay = math.random(0, 150) / 1000
                task.wait(delay)
                local burst = targetPart:Clone()
                burst.Anchored = true
                burst.CanCollide = false
                burst.CanQuery = false
                burst.CanTouch = false
                burst.CastShadow = false
                burst.Color = Color3.fromRGB(255, 255, 255)
                burst.Material = Enum.Material.SmoothPlastic
                burst.Size = targetPart.Size
                burst.Transparency = 0.6
                burst.Massless = true
                burst.CFrame = CFrame.new(partPos) *
                                   CFrame.fromEulerAngles(math.random(0, 628) / 100, math.random(0, 628) / 100,
                        math.random(0, 628) / 100)
                burst.Parent = ws
                local rx = math.random(80, 200) * (math.pi / 180)
                local ry = math.random(80, 200) * (math.pi / 180)
                local rz = math.random(80, 200) * (math.pi / 180)
                local startTime = os.clock()
                local growDuration = 1.0
                local fadeDuration = 0.12
                local growConn
                growConn = game:GetService("RunService").Heartbeat:Connect(function(dt)
                    if not burst.Parent then
                        growConn:Disconnect()
                        return
                    end
                    local elapsed = os.clock() - startTime
                    local t = math.min(elapsed / growDuration, 1)
                    burst.Size = targetPart.Size + Vector3.new(5 * t, 5 * t, 5 * t)
                    burst.CFrame = burst.CFrame * CFrame.fromEulerAngles(rx * dt, ry * dt, rz * dt)
                    if t >= 1 then
                        growConn:Disconnect()
                        local fadeStart = os.clock()
                        local fadeConn
                        fadeConn = game:GetService("RunService").Heartbeat:Connect(function(dt2)
                            if not burst.Parent then
                                fadeConn:Disconnect()
                                return
                            end
                            local fp = math.min((os.clock() - fadeStart) / fadeDuration, 1)
                            burst.Transparency = 0.6 + 0.4 * fp
                            burst.CFrame = burst.CFrame * CFrame.fromEulerAngles(rx * dt2, ry * dt2, rz * dt2)
                            if fp >= 1 then
                                fadeConn:Disconnect()
                                burst:Destroy()
                            end
                        end)
                    end
                end)
            end)
        end

        task.delay(60, function()
            brokenParts[targetPart] = nil
            if targetPart and targetPart.Parent then
                pcall(function()
                    targetPart.Transparency = originalTransparency
                end)
            end
        end)

        return true
    end

    return {
        cframes = cframes,
        joints = joints,
        fling = predictionfling,
        predictionfling = predictionfling,
        refreshjoints = refreshjoints,
        raycastlegs = raycastlegs,
        velbycfrvec = velbycfrvec,
        velchgbycfrvec = velchgbycfrvec,
        velYchg = velYchg,
        addmode = addmode,
        getPart = getPart,
        getPartFromMesh = getPartFromMesh,
        getAccWeldFromMesh = getAccWeldFromMesh,
        getJoint = getJoint,
        getPartJoint = getPartJoint,
        rotToMouse = rotToMouse,
        glitchJoint = glitchJoint,
        setWalkSpeed = setWalkSpeed,
        setJumpPower = setJumpPower,
        setGravity = setGravity,
        setCfr = setCfr,
        getVel = getVel,
        getCamCF = getCamCF,
        isFirstPerson = isFirstPerson,
        setHipHeight = setHipHeight,
        fireAttack = fireAttack,
        attacks = attacks,
        spawnLightning = spawnLightning,
        destroyLightning = destroyLightning,
        getLightningActive = function()
            return lightningActive
        end,
        setLightningActive = function(v)
            lightningActive = v
        end,
        spawnHatTrail = spawnHatTrail,
        getAttackProgress = function()
            return attackProgress
        end,
        mouseTp = mouseTp,
        breakPart = breakPart,
        shootLine = shootLine
    }
end

-- ══════════════════════════════════════════════
-- Everything below this line is YOUR original
-- Lightning Cannon GUI + C_c() unchanged
-- ══════════════════════════════════════════════

local TweenService = game:GetService("TweenService")
local LMG2L = {};

local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

LMG2L["ScreenGui_1"] = Instance.new("ScreenGui", playerGui);
LMG2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
LMG2L["ScreenGui_1"]["ResetOnSpawn"] = false;

LMG2L["Frame_2"] = Instance.new("Frame", LMG2L["ScreenGui_1"]);
LMG2L["Frame_2"]["BorderSizePixel"] = 0;
LMG2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(255, 170, 115);
LMG2L["Frame_2"]["Size"] = UDim2.new(0, 450, 0, 186);
LMG2L["Frame_2"]["Position"] = UDim2.new(0, 672, 0, 412);
LMG2L["Frame_2"]["BackgroundTransparency"] = 0.3;
LMG2L["Frame_2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
LMG2L["Frame_2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

local dragDetector = Instance.new("UIDragDetector", LMG2L["Frame_2"])
dragDetector.DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane

LMG2L["UICorner_3"] = Instance.new("UICorner", LMG2L["Frame_2"]);
LMG2L["UICorner_3"]["CornerRadius"] = UDim.new(0, 12);

LMG2L["TextLabel_4"] = Instance.new("TextLabel", LMG2L["Frame_2"]);
LMG2L["TextLabel_4"]["BorderSizePixel"] = 0;
LMG2L["TextLabel_4"]["TextSize"] = 24;
LMG2L["TextLabel_4"]["BackgroundColor3"] = Color3.fromRGB(158, 67, 12);
LMG2L["TextLabel_4"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold,
    Enum.FontStyle.Normal);
LMG2L["TextLabel_4"]["TextColor3"] = Color3.fromRGB(54, 17, 0);
LMG2L["TextLabel_4"]["BackgroundTransparency"] = 0.699;
LMG2L["TextLabel_4"]["Size"] = UDim2.new(0, 450, 0, 54);
LMG2L["TextLabel_4"]["Text"] = [[Lightning Cannon Reanimate]];

LMG2L["UICorner_5"] = Instance.new("UICorner", LMG2L["TextLabel_4"]);
LMG2L["UICorner_5"]["CornerRadius"] = UDim.new(0, 12);

LMG2L["TextLabel2_6"] = Instance.new("TextLabel", LMG2L["Frame_2"]);
LMG2L["TextLabel2_6"]["TextWrapped"] = true;
LMG2L["TextLabel2_6"]["BorderSizePixel"] = 0;
LMG2L["TextLabel2_6"]["TextSize"] = 12;
LMG2L["TextLabel2_6"]["BackgroundColor3"] = Color3.fromRGB(158, 67, 12);
LMG2L["TextLabel2_6"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold,
    Enum.FontStyle.Normal);
LMG2L["TextLabel2_6"]["TextColor3"] = Color3.fromRGB(54, 17, 0);
LMG2L["TextLabel2_6"]["BackgroundTransparency"] = 0.699;
LMG2L["TextLabel2_6"]["Size"] = UDim2.new(0, 204, 0, 82);
LMG2L["TextLabel2_6"]["Text"] = [[Lightning Cannon - Exire]];
LMG2L["TextLabel2_6"]["Name"] = [[TextLabel2]];
LMG2L["TextLabel2_6"]["Position"] = UDim2.new(0, 14, 0, 76);

LMG2L["UICorner_7"] = Instance.new("UICorner", LMG2L["TextLabel2_6"]);
LMG2L["UICorner_7"]["CornerRadius"] = UDim.new(0, 12);

LMG2L["UIStroke_8"] = Instance.new("UIStroke", LMG2L["TextLabel2_6"]);
LMG2L["UIStroke_8"]["Transparency"] = 0.3;
LMG2L["UIStroke_8"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
LMG2L["UIStroke_8"]["Thickness"] = 2;
LMG2L["UIStroke_8"]["Color"] = Color3.fromRGB(59, 30, 0);

LMG2L["TextButton_9"] = Instance.new("TextButton", LMG2L["Frame_2"]);
LMG2L["TextButton_9"]["BorderSizePixel"] = 0;
LMG2L["TextButton_9"]["TextSize"] = 24;
LMG2L["TextButton_9"]["TextColor3"] = Color3.fromRGB(54, 17, 0);
LMG2L["TextButton_9"]["BackgroundColor3"] = Color3.fromRGB(149, 52, 0);
LMG2L["TextButton_9"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold,
    Enum.FontStyle.Normal);
LMG2L["TextButton_9"]["BackgroundTransparency"] = 0.8;
LMG2L["TextButton_9"]["Size"] = UDim2.new(0, 194, 0, 82);
LMG2L["TextButton_9"]["Text"] = [[Reanimate]];
LMG2L["TextButton_9"]["Position"] = UDim2.new(0, 230, 0, 76);

LMG2L["UICorner_a"] = Instance.new("UICorner", LMG2L["TextButton_9"]);
LMG2L["UICorner_a"]["CornerRadius"] = UDim.new(0, 12);

LMG2L["UIStroke_b"] = Instance.new("UIStroke", LMG2L["TextButton_9"]);
LMG2L["UIStroke_b"]["Transparency"] = 0.3;
LMG2L["UIStroke_b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
LMG2L["UIStroke_b"]["Thickness"] = 2;
LMG2L["UIStroke_b"]["Color"] = Color3.fromRGB(59, 30, 0);

LMG2L["LocalScript_c"] = Instance.new("LocalScript", LMG2L["TextButton_9"]);

LMG2L["UIStroke_d"] = Instance.new("UIStroke", LMG2L["Frame_2"]);
LMG2L["UIStroke_d"]["Transparency"] = 0.3;
LMG2L["UIStroke_d"]["Thickness"] = 3;
LMG2L["UIStroke_d"]["Color"] = Color3.fromRGB(59, 30, 0);

LMG2L["MinButton"] = Instance.new("TextButton", LMG2L["Frame_2"])
local minBtn = LMG2L["MinButton"]
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -35, 0, 5)
minBtn.BackgroundColor3 = Color3.fromRGB(158, 67, 12)
minBtn.BackgroundTransparency = 0.8;
minBtn.Text = "—"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 8)
MinStroke = Instance.new("UIStroke", minBtn)
MinStroke.Transparency = 0.3;
MinStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
MinStroke.Thickness = 2;
MinStroke.Color = Color3.fromRGB(59, 30, 0);

local function C_c()
    local mainFrame = LMG2L["Frame_2"]
    local minBtn = LMG2L["MinButton"]
    local reBtn = LMG2L["TextButton_9"]
    local isMinimized = false
    local originalSize = mainFrame.Size
    local tInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

    minBtn.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        local targetSize = isMinimized and UDim2.new(0, 40, 0, 40) or originalSize

        TweenService:Create(mainFrame, tInfo, {
            Size = targetSize
        }):Play()

        for _, child in pairs(mainFrame:GetChildren()) do
            if child ~= minBtn and child:IsA("GuiObject") then
                child.Visible = not isMinimized
            end
        end
        minBtn.Text = isMinimized and "+" or "—"
    end)

    reBtn.MouseButton1Click:Connect(function()
        local t = reanimate()
        if type(t) ~= "table" then
            return
        end
        local spawnHatTrail = t.spawnHatTrail
        local shootLine = t.shootLine
        local breakPart = t.breakPart
        local spawnLightning = t.spawnLightning
        local getAttackProgress = t.getAttackProgress
        local destroyLightning = t.destroyLightning
        local function getLightningActive()
            return t.getLightningActive()
        end
        local function setLightningActive(v)
            t.setLightningActive(v)
        end
        local fireAttack = t.fireAttack
        local attacks = t.attacks
        local velYchg = t.velYchg
        local Yvel = t.Yvel
        local raycastlegs = t.raycastlegs
        local getPartFromMesh = t.getPartFromMesh
        local getPartJoint = t.getPartJoint
        local velbycfrvec = t.velbycfrvec
        local setWalkSpeed = t.setWalkSpeed
        local rgb = Color3.fromRGB
        local R6parts = t.R6parts
        local setCamOffset = t.setCamOffset
        local Player = game.Players.LocalPlayer
        local getVel = t.getVel
        local IsWalking = t.IsWalking
        local getJoint = t.getJoint
        local setCfr = t.setCfr
        local cframes = t.cframes
        local getPart = t.getPart
        local joints = t.joints
        local refreshjoints = t.refreshjoints
        local onnewcamera = t.onnewcamera
        local SoundService = game.SoundService
        local setHipHeight = t.setHipHeight
        local getAccWeldFromMesh = t.getAccWeldFromMesh
        local mouseTp = t.mouseTp

        local addmode = t.addmode
        local getJoint = t.getJoint
        local velbycfrvec = t.velbycfrvec
        local RootJoint = getJoint("RootJoint")
        local RightShoulder = getJoint("Right Shoulder")
        local LeftShoulder = getJoint("Left Shoulder")
        local RightHip = getJoint("Right Hip")
        local LeftHip = getJoint("Left Hip")
        local Neck = getJoint("Neck")

        if not ReanimateStartPos then
            ReanimateStartPos = RootJoint.Position
        end

        local gun = getPartFromMesh(6831441507, 6833003967)
        local AJBackAccessory = getPartJoint(gun)
        local Pixie = getPartFromMesh(128216670, 150379943)
        local SpringPixie_150381051_LC = getPartJoint(Pixie)
        local staff = getPartFromMesh(5548423017, 5548423938)
        local CrystalStaff = getPartJoint(staff)
        local rock = getPartFromMesh(4307568890, 4307568951)
        local RockAccessory = getPartJoint(rock)
        local screen = getPartFromMesh(139838579317536, 70409502005996)
        local screen2 = getPartFromMesh(9063953843, 82632102840608)
        local bluescreen = getPartJoint(screen) or getPartJoint(screen2)
        local lastGunPart = nil
        local RunService = game:GetService("RunService")

        local RunService = game:GetService("RunService")

        local function setupEffects(part)
            if not part or not part:IsA("BasePart") then
                return
            end
            if part:FindFirstChild("GunEffectsDone") then
                return
            end

            local tag = Instance.new("BoolValue")
            tag.Name = "GunEffectsDone"
            tag.Parent = part

            -- swirling energy ring
            local ring = Instance.new("ParticleEmitter")
            ring.Texture = "rbxassetid://5606212524"
            ring.Rate = 6
            ring.Lifetime = NumberRange.new(0.3, 0.6)
            ring.Speed = NumberRange.new(0, 0.1)
            ring.SpreadAngle = Vector2.new(360, 360)
            ring.RotSpeed = NumberRange.new(-200, 200)
            ring.Rotation = NumberRange.new(0, 360)
            ring.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.6), NumberSequenceKeypoint.new(0.5, 0.9),
                                            NumberSequenceKeypoint.new(1, 0)})
            ring.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1),
                                                    NumberSequenceKeypoint.new(0.6, 0.4),
                                                    NumberSequenceKeypoint.new(1, 1)})
            ring.LightEmission = 1
            ring.LightInfluence = 0
            ring.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 160, 255)),
                                            ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 100, 255))})
            ring.Parent = part

            -- sharp spark streaks
            local sparks = Instance.new("ParticleEmitter")
            sparks.Texture = "rbxassetid://6880496088"
            sparks.Rate = 12
            sparks.Lifetime = NumberRange.new(0.08, 0.18)
            sparks.Speed = NumberRange.new(0.5, 2)
            sparks.SpreadAngle = Vector2.new(180, 180)
            sparks.RotSpeed = NumberRange.new(-90, 90)
            sparks.Rotation = NumberRange.new(0, 360)
            sparks.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 0)})
            sparks.Transparency = NumberSequence.new(
                {NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)})
            sparks.LightEmission = 1
            sparks.LightInfluence = 0
            sparks.Color = ColorSequence.new(Color3.fromRGB(220, 210, 255))
            sparks.Parent = part

            -- soft glowing orbs drifting up
            local orbs = Instance.new("ParticleEmitter")
            orbs.Texture = "rbxassetid://4740758626"
            orbs.Rate = 10
            orbs.Lifetime = NumberRange.new(1.0, 2.0)
            orbs.Speed = NumberRange.new(0.05, 0.3)
            orbs.SpreadAngle = Vector2.new(360, 360)
            orbs.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(0.4, 0.18),
                                            NumberSequenceKeypoint.new(1, 0)})
            orbs.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2),
                                                    NumberSequenceKeypoint.new(0.5, 0.5),
                                                    NumberSequenceKeypoint.new(1, 1)})
            orbs.LightEmission = 1
            orbs.LightInfluence = 0
            orbs.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 185, 255)),
                                            ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 120, 255))})
            orbs.Parent = part
        end

        local function applyNeon(part)
            if not part or not part:IsA("BasePart") then
                return
            end
            pcall(function()
                if part:IsA("MeshPart") then
                    part.TextureID = ""
                else
                    local sm = part:FindFirstChildOfClass("SpecialMesh")
                    if sm then
                        sm.TextureId = ""
                    end
                end
                part.Material = Enum.Material.Neon
                part.Color = Color3.fromRGB(200, 180, 255)
                part.CastShadow = false
            end)
        end

        RunService.Heartbeat:Connect(function()
            local gunPart = gun and gun.p
            if not gunPart then
                return
            end

            if gunPart ~= lastGunPart then
                lastGunPart = gunPart

                -- APPLY TO ALL PARTS (this fixes your "not neon" issue)
                for _, v in ipairs(gunPart:GetDescendants()) do
                    if v:IsA("BasePart") then
                        applyNeon(v)
                        setupEffects(v)
                    end
                end

                -- also apply to root
                applyNeon(gunPart)
                setupEffects(gunPart)
            end
        end)
        local activeBoomLoop = false
        local boomSounds = {}

        function stopBoomLoop()
            activeBoomLoop = false
            for _, s in ipairs(boomSounds) do
                if s then
                    s:Stop()
                    s:Destroy()
                end
            end
            table.clear(boomSounds)
        end

        local function soundFromLink(link)
            local folder = "ExiresGlitcher"
            if isfolder and not isfolder(folder) then
                makefolder(folder)
            end
            local path = folder .. "/taunt.mp3"

            if not isfile(path) then
                local req = (syn and syn.request) or (http and http.request) or http_request or request
                if not req then
                    warn("No http request function found")
                    return nil
                end
                local res = req({
                    Url = link,
                    Method = "GET"
                })
                if not res.Success then
                    warn("Download failed: " .. tostring(res.StatusCode))
                    return nil
                end
                writefile(path, res.Body)
            end

            local assetId = getcustomasset(path)
            local sound = Instance.new("Sound")
            sound.SoundId = assetId
            sound.Volume = 1
            sound.Looped = false
            sound.Parent = game:GetService("SoundService")
            return sound
        end

        attacks["default"] = attacks["default"] or {}
        attacks["f"] = attacks["f"] or {}

        attacks["default"]["z"] = {
            duration = 1,
            _tpFired = false,
            fn = function()
                local progress = getAttackProgress()
                local attackDef = attacks["default"]["z"]
                attackDef._soundPlayed = false
                if not attackDef._tpFired then
                    attackDef._tpFired = true
                    mouseTp()
                end

                if progress > 0.8 then
                    twait(0.2)
                    attackDef._tpFired = false
                end
                bluescreen.C0 = Lerp(bluescreen.C0,
                    cfMul(cf(-0.1839487176192431, 0.1387184544613485, -4.064499704461348), angles(
                        0.5474965815569393 + 0.1 * sin(sine * 2), -2.602993833401182 - 0.1 * sin(sine * 3 + 0.5), 0)),
                    deltaTime)
                RootJoint.C0 = Lerp(RootJoint.C0, cfMul(cf(0, 0, 0), angles(-1.446930742166087 - 0.1 * sin(sine * 2),
                    -0.06903922743372171, -3.497620848076365)), deltaTime)
                Neck.C0 = Lerp(Neck.C0,
                    cfMul(cf(0, 1, 0),
                        angles(-1.75193052750477 + 0.1 * sin(sine * 2), -0.008036579171620595 - 0.05 * sin(sine * 1),
                            -2.946820825436743)), deltaTime)
                LeftHip.C0 = Lerp(LeftHip.C0, cfMul(cf(-1, -1, 0), angles(-0.2215391201030625 + 0.1 * sin(sine * 2),
                    -1.201133868858104, 0)), deltaTime)
                LeftShoulder.C0 = Lerp(LeftShoulder.C0,
                    cfMul(cf(-0.8344764040227517, 0.5061554490474229, -0.2005674127946824),
                        angles(0.6970563443828333 + 0.1 * sin(sine * 2), -1.048633976188762, 0.6970563443828333)),
                    deltaTime)
                RightHip.C0 = Lerp(RightHip.C0, cfMul(cf(1, -1, 0), angles(-0.2825384043722083 + 0.1 * sin(sine * 2),
                    1.308852287298644, 0.1462563217432109)), deltaTime)
                RightShoulder.C0 = Lerp(RightShoulder.C0, cfMul(cf(1.017565810889528, 0.5, 0), angles(
                    -0.007679995918295823 + 0.1 * sin(sine * 2), 1.126211017744532, -0.1601798885876375)), deltaTime)
                RockAccessory.C0 = Lerp(RockAccessory.C0,
                    cfMul(cf(-10, -0.392061710357666 + 2.5 * sin(sine * 10), 0.07364007830619812),
                        angles(0.005527040426526852, (0.03602500056462166 + sine * 25), -0)), deltaTime)
            end
        }
        attacks["default"]["m1"] = {
            duration = 1,
            _active = false,
            _linePart = nil,
            fn = function()
                local progress = getAttackProgress()
                local attackDef = attacks["default"]["m1"]

                -- fire once on first frame
                if not attackDef._active then
                    attackDef._active = true

                    local target = insGet(mouse, "Target")
                    if target and IsA(target, "BasePart") then
                        breakPart(target)
                        local targetPos = target.Position
                        for _, obj in ipairs(ws:GetDescendants()) do
                            if IsA(obj, "BasePart") and obj ~= target then
                                if (obj.Position - targetPos).Magnitude <= 15 then
                                    breakPart(obj)
                                end
                            end
                        end
                    end

                    -- create one persistent laser part
                    local linePart = Instance.new("Part")
                    linePart.Anchored = true
                    linePart.CanCollide = false
                    linePart.CanQuery = false
                    linePart.CanTouch = false
                    linePart.CastShadow = false
                    linePart.Material = Enum.Material.Neon
                    linePart.Color = Color3.fromRGB(200, 180, 255)
                    linePart.Transparency = 0
                    linePart.Massless = true
                    linePart.Size = Vector3.new(0.4, 0.4, 2)
                    linePart.Parent = ws
                    attackDef._linePart = linePart
                end

                -- update laser every frame to track mouse, no new parts
                local gunPart = gun and gun.p
                local mouseHit = insGet(mouse, "Hit")
                local linePart = attackDef._linePart

                if gunPart and mouseHit and linePart and linePart.Parent then
                    local from = gunPart.Position
                    local to = cfGet(mouseHit, "Position")
                    local length = (to - from).Magnitude
                    if length > 0.1 then
                        linePart.Size = Vector3.new(0.4, 0.4, length)
                        linePart.CFrame = CFrame.lookAt((from + to) * 0.5, to)
                    end

                    -- rock follows gun tip toward mouse hit
                    local rockDir = (to - from)
                    local rockT = math.min(progress * 2, 1) -- slides out along beam
                    local rockPos = from + rockDir * rockT
                    RockAccessory.C0 = cf(rockPos.X - cfGet(cframes[getPart("Torso")], "X"),
                        rockPos.Y - cfGet(cframes[getPart("Torso")], "Y") + 1,
                        rockPos.Z - cfGet(cframes[getPart("Torso")], "Z")) * angles(0, 0.04686378586849749, 0)

                    -- break hovered part
                    local hovered = insGet(mouse, "Target")
                    if hovered and IsA(hovered, "BasePart") then
                        breakPart(hovered)
                    end
                end

                bluescreen.C0 = Lerp(bluescreen.C0,
                    cfMul(cf(-0.1839487176192431, 0.1387184544613485, -4.064499704461348), angles(
                        0.5474965815569393 + 0.1 * sin(sine * 2), -2.602993833401182 - 0.1 * sin(sine * 3 + 0.5), 0)),
                    deltaTime)
                RootJoint.C0 = Lerp(RootJoint.C0, cfMul(cf(0, 0, 0), angles(-1.446930742166087 - 0.1 * sin(sine * 2),
                    -0.06903922743372171, -3.497620848076365)), deltaTime)
                Neck.C0 = Lerp(Neck.C0,
                    cfMul(cf(0, 1, 0),
                        angles(-1.75193052750477 + 0.1 * sin(sine * 2), -0.008036579171620595 - 0.05 * sin(sine * 1),
                            -2.946820825436743)), deltaTime)
                LeftHip.C0 = Lerp(LeftHip.C0, cfMul(cf(-1, -1, 0), angles(-0.2215391201030625 + 0.1 * sin(sine * 2),
                    -1.201133868858104, 0)), deltaTime)
                LeftShoulder.C0 = Lerp(LeftShoulder.C0,
                    cfMul(cf(-0.8344764040227517, 0.5061554490474229, -0.2005674127946824),
                        angles(0.6970563443828333 + 0.1 * sin(sine * 2), -1.048633976188762, 0.6970563443828333)),
                    deltaTime)
                RightHip.C0 = Lerp(RightHip.C0, cfMul(cf(1, -1, 0), angles(-0.2825384043722083 + 0.1 * sin(sine * 2),
                    1.308852287298644, 0.1462563217432109)), deltaTime)
                RightShoulder.C0 = Lerp(RightShoulder.C0, cfMul(cf(1.017565810889528, 0.5, 0), angles(
                    1.989330874394852 + 0.1 * sin(sine * 2), 1.438534215748186, -0.4919503298692893)), deltaTime)
                RockAccessory.C0 = Lerp(RockAccessory.C0, cfMul(
                    cf(-0.556640625, 37.5 + 75 * sin(sine * 25), -0.1183305706894187),
                    angles(0, 0.04686378586849749, -0)), deltaTime)
                AJBackAccessory.C0 = cf(1, 0, 0) * angles(rad(0), rad(0), rad(-72))
                AJBackAccessory.Part1 = getPart("Right Arm")
                AJBackAccessory.C1 = cf_0

                -- cleanup on last frame
                if progress > 0.8 then
                    twait(0.2)
                    if attackDef._linePart and attackDef._linePart.Parent then
                        attackDef._linePart:Destroy()
                    end
                    attackDef._linePart = nil
                    attackDef._active = false
                end
            end
        }
        attacks["default"]["e"] = {
            duration = 0.33,
            _fired = false,
            fn = function()
                local progress = getAttackProgress()
                local attackDef = attacks["default"]["e"]

                if not attackDef._fired then
                    attackDef._fired = true

                    local gunPart = gun and gun.p
                    local mouseHit = insGet(mouse, "Hit")

                    if gunPart and mouseHit then
                        local from = gunPart.Position
                        local to = cfGet(mouseHit, "Position")

                        -- spawn VFX at gun tip
                        task.spawn(function()
                            for j = 1, 5 do
                                local burst = Instance.new("Part")
                                burst.Anchored = true
                                burst.CanCollide = false
                                burst.CanQuery = false
                                burst.CanTouch = false
                                burst.CastShadow = false
                                burst.Material = Enum.Material.Neon
                                burst.Color = Color3.fromRGB(200, 180, 255)
                                burst.Size = Vector3.new(0.5, 0.5, 0.5)
                                burst.Transparency = 0.3
                                burst.CFrame = CFrame.new(from) *
                                                   CFrame.fromEulerAngles(math.random(0, 628) / 100,
                                        math.random(0, 628) / 100, math.random(0, 628) / 100)
                                burst.Parent = ws
                                local s = os.clock()
                                local conn
                                conn = game:GetService("RunService").Heartbeat:Connect(function(dt)
                                    if not burst.Parent then
                                        conn:Disconnect()
                                        return
                                    end
                                    local t = math.min((os.clock() - s) / 0.4, 1)
                                    burst.Size = Vector3.new(0.5 + 3 * t, 0.5 + 3 * t, 0.5 + 3 * t)
                                    burst.Transparency = 0.3 + 0.7 * t
                                    if t >= 1 then
                                        conn:Disconnect()
                                        burst:Destroy()
                                    end
                                end)
                            end
                        end)

                        -- make nearby players transparent
                        task.spawn(function()
                            for _, plr in ipairs(game:GetService("Players"):GetPlayers()) do
                                if plr ~= game.Players.LocalPlayer and plr.Character then
                                    local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                                    if hrp and (hrp.Position - to).Magnitude <= 5 then
                                        for _, part in ipairs(plr.Character:GetDescendants()) do
                                            if part:IsA("BasePart") or part:IsA("Decal") then
                                                local orig = part.Transparency
                                                pcall(function()
                                                    part.Transparency = 0.85
                                                end)
                                                task.delay(2, function()
                                                    pcall(function()
                                                        part.Transparency = orig
                                                    end)
                                                end)
                                            end
                                        end
                                    end
                                end
                            end
                        end)
                    end
                end

                if progress > 0.9 then
                    attackDef._fired = false
                end
                bluescreen.C0 = Lerp(bluescreen.C0,
                    cfMul(cf(-0.1839487176192431, 0.1387184544613485, -4.064499704461348), angles(
                        0.5474965815569393 + 0.1 * sin(sine * 2), -2.602993833401182 - 0.1 * sin(sine * 3 + 0.5), 0)),
                    deltaTime)
                RootJoint.C0 = Lerp(RootJoint.C0, cfMul(cf(0, 0, 0), angles(-1.446930742166087 - 0.1 * sin(sine * 2),
                    -0.06903922743372171, -3.497620848076365)), deltaTime)
                Neck.C0 = Lerp(Neck.C0,
                    cfMul(cf(0, 1, 0),
                        angles(-1.75193052750477 + 0.1 * sin(sine * 2), -0.008036579171620595 - 0.05 * sin(sine * 1),
                            -2.946820825436743)), deltaTime)
                LeftHip.C0 = Lerp(LeftHip.C0, cfMul(cf(-1, -1, 0), angles(-0.2215391201030625 + 0.1 * sin(sine * 2),
                    -1.201133868858104, 0)), deltaTime)
                LeftShoulder.C0 = Lerp(LeftShoulder.C0,
                    cfMul(cf(-0.8344764040227517, 0.5061554490474229, -0.2005674127946824),
                        angles(0.6970563443828333 + 0.1 * sin(sine * 2), -1.048633976188762, 0.6970563443828333)),
                    deltaTime)
                RightHip.C0 = Lerp(RightHip.C0, cfMul(cf(1, -1, 0), angles(-0.2825384043722083 + 0.1 * sin(sine * 2),
                    1.308852287298644, 0.1462563217432109)), deltaTime)
                RightShoulder.C0 = Lerp(RightShoulder.C0, cfMul(cf(0.8144311737595942, 0.5, 0),
                    angles(0.5605589662046579 + 1 * sin(sine * 15), 2.150156649630022 - 1 * sin(sine * 15),
                        0.3273198786010107 - 1 * sin(sine * 15))), deltaTime)
                AJBackAccessory.C0 = cf(1, 0, 0) * angles(rad(0), rad(0), rad(-72))
                AJBackAccessory.Part1 = getPart("Right Arm")
                AJBackAccessory.C1 = cf_0
                RockAccessory.C0 = Lerp(RockAccessory.C0,
                    cfMul(cf(-0.5793895721435547, 100, 0.07364007830619812), angles(0, 0, 0)), deltaTime)
            end
        }
        attacks["default"]["r"] = {
            duration = 1,
            _vfxSpawned = false,
            _vfxInsts = {},
            _vfxConns = {},
            fn = function()
                local rockmove = false
                local progress = getAttackProgress()
                local attackDef = attacks["default"]["r"]
                attackDef._soundPlayed = false
                if ReanimateStartPos and RootJoint then
                    RootJoint.CFrame = CFrame.new(ReanimateStartPos + Vector3.new(0, 10, 0))
                end
            end
        }

        local ModeV = ""
        t.setJumpPower(65)
        t.setWalkSpeed(20)

        addmode("default", {
            idle = function()
                bluescreen.C0 = Lerp(bluescreen.C0,
                    cfMul(cf(-0.1839487176192431, 0.1387184544613485, -4.064499704461348), angles(
                        0.5474965815569393 + 0.1 * sin(sine * 2), -2.602993833401182 - 0.1 * sin(sine * 3 + 0.5), 0)),
                    deltaTime)
                RootJoint.C0 = Lerp(RootJoint.C0, cfMul(cf(0, 0, 0), angles(-1.446930742166087 - 0.1 * sin(sine * 2),
                    -0.06903922743372171, -3.497620848076365)), deltaTime)
                Neck.C0 = Lerp(Neck.C0,
                    cfMul(cf(0, 1, 0),
                        angles(-1.75193052750477 + 0.1 * sin(sine * 2), -0.008036579171620595 - 0.05 * sin(sine * 1),
                            -2.946820825436743)), deltaTime)
                LeftHip.C0 = Lerp(LeftHip.C0, cfMul(cf(-1, -1, 0), angles(-0.2215391201030625 + 0.1 * sin(sine * 2),
                    -1.201133868858104, 0)), deltaTime)
                LeftShoulder.C0 = Lerp(LeftShoulder.C0,
                    cfMul(cf(-0.8344764040227517, 0.5061554490474229, -0.2005674127946824),
                        angles(0.6970563443828333 + 0.1 * sin(sine * 2), -1.048633976188762, 0.6970563443828333)),
                    deltaTime)
                RightHip.C0 = Lerp(RightHip.C0, cfMul(cf(1, -1, 0), angles(-0.2825384043722083 + 0.1 * sin(sine * 2),
                    1.308852287298644, 0.1462563217432109)), deltaTime)
                RightShoulder.C0 = Lerp(RightShoulder.C0, cfMul(cf(1.017565810889528, 0.5, 0), angles(
                    -0.007679995918295823 + 0.1 * sin(sine * 2), 1.126211017744532, -0.1601798885876375)), deltaTime)
                RockAccessory.C0 = Lerp(RockAccessory.C0,
                    cfMul(cf(-0.5793895721435547, 100, 0.07364007830619812), angles(0, 0, 0)), deltaTime)
                AJBackAccessory.C0 = cf(1, 0, 0) * angles(rad(0), rad(0), rad(-72))
                AJBackAccessory.Part1 = getPart("Right Arm")
                AJBackAccessory.C1 = cf_0
            end,
            walk = function()
                bluescreen.C0 = Lerp(bluescreen.C0,
                    cfMul(cf(-0.1839487176192431, 0.1387184544613485, -4.064499704461348), angles(
                        0.5474965815569393 + 0.1 * sin(sine * 2), -2.602993833401182 - 0.1 * sin(sine * 3 + 0.5), 0)),
                    deltaTime)
                RootJoint.C0 = Lerp(RootJoint.C0, cfMul(cf(0, 0, 0), angles(-1.446930742166087, -0.002152955491768971,
                    -3.062939134288139)), deltaTime)
                Neck.C0 = Lerp(Neck.C0, cfMul(cf(0, 1, 0), angles(-1.75193052750477,
                    -0.008036579171620595 - 0.05 * sin(sine * 1), -3.18493770282643)), deltaTime)
                LeftHip.C0 = Lerp(LeftHip.C0, cfMul(cf(-1, -1, 0), angles(-0.2215391201030625 + 0.6 * sin(sine * 4),
                    -1.201133868858104, 0)), deltaTime)
                LeftShoulder.C0 = Lerp(LeftShoulder.C0,
                    cfMul(cf(-0.8344764040227517, 0.5061554490474229, -0.2005674127946824),
                        angles(0.3351445262164097 - 0.6 * sin(sine * 4), -1.715545579693869, 0.6062722664822413)),
                    deltaTime)
                RightHip.C0 = Lerp(RightHip.C0, cfMul(cf(1, -1, 0), angles(-0.2825384043722083 - 0.6 * sin(sine * 4),
                    1.308852287298644, 0.1462563217432109)), deltaTime)
                RightShoulder.C0 = Lerp(RightShoulder.C0, cfMul(cf(1.017565810889528, 0.5, 0), angles(
                    0.5809380355314362 + 0.6 * sin(sine * 4), 1.438534215748186, -0.4919503298692893)), deltaTime)
                RockAccessory.C0 = Lerp(RockAccessory.C0,
                    cfMul(cf(-0.5793895721435547, 100, 0.07364007830619812), angles(0, 0, 0)), deltaTime)
                AJBackAccessory.C0 = cf(1, 0, 0) * angles(rad(0), rad(0), rad(-72))
                AJBackAccessory.Part1 = getPart("Right Arm")
                AJBackAccessory.C1 = cf_0
            end,
            jump = function()
                bluescreen.C0 = Lerp(bluescreen.C0,
                    cfMul(cf(-0.1839487176192431, 0.1387184544613485, -4.064499704461348), angles(
                        0.5474965815569393 + 0.1 * sin(sine * 2), -2.602993833401182 - 0.1 * sin(sine * 3 + 0.5), 0)),
                    deltaTime)
                RootJoint.C0 = Lerp(RootJoint.C0,
                    cfMul(cf(0, 0, 0),
                        angles(-1.80884256033251 - 0.05 * sin(sine * 10), -0.002152955491768971 + 0.05 * sin(sine * 15),
                            -3.062939134288139)), deltaTime)
                Neck.C0 = Lerp(Neck.C0, cfMul(cf(0, 1, 0), angles(-2.266345602333491,
                    -0.008036579171620595 - 0.05 * sin(sine * 1), -3.18493770282643)), deltaTime)
                LeftHip.C0 = Lerp(LeftHip.C0, cfMul(cf(-1, -0.4885676869174898, -0.6341954281455591), angles(
                    -0.2215391201030625 + 0.056 * sin(sine * 7), -1.201133868858104, 0)), deltaTime)
                LeftShoulder.C0 = Lerp(LeftShoulder.C0, cfMul(cf(-1, 0.5, -0.2005674127946824), angles(
                    -1.563045687024527 - 0.1 * sin(sine * 15), -1.103749636778057 - 0.1 * sin(sine * 10),
                    -1.532544362893477)), deltaTime)
                RightHip.C0 = Lerp(RightHip.C0, cfMul(cf(1.094777960526315, -0.8540638706140351, -0.6827371162280702),
                    angles(-0.002152955491768971 - 0.056 * sin(sine * 8), 1.308852287298644, 0.1462563217432109)),
                    deltaTime)
                RightShoulder.C0 = Lerp(RightShoulder.C0, cfMul(cf(1.017565810889528, 0.5, 0), angles(
                    -1.256249529447398 + 0.1 * sin(sine * 15), 1.31473927497145 + 0.1 * sin(sine * 10),
                    1.438534215748186)), deltaTime)
                RockAccessory.C0 = Lerp(RockAccessory.C0,
                    cfMul(cf(-0.5793895721435547, 100, 0.07364007830619812), angles(0, 0, 0)), deltaTime)
                AJBackAccessory.C0 = cf(1, 0, 0) * angles(rad(0), rad(0), rad(-72))
                AJBackAccessory.Part1 = getPart("Right Arm")
                AJBackAccessory.C1 = cf_0
            end,
            fall = function()
                bluescreen.C0 = Lerp(bluescreen.C0,
                    cfMul(cf(-0.1839487176192431, 0.1387184544613485, -4.064499704461348), angles(
                        0.5474965815569393 + 0.1 * sin(sine * 2), -2.602993833401182 - 0.1 * sin(sine * 3 + 0.5), 0)),
                    deltaTime)
                RootJoint.C0 = Lerp(RootJoint.C0,
                    cfMul(cf(0, 0, 0),
                        angles(-1.80884256033251 - 0.05 * sin(sine * 10), -0.002152955491768971 + 0.05 * sin(sine * 15),
                            -3.062939134288139)), deltaTime)
                Neck.C0 = Lerp(Neck.C0, cfMul(cf(0, 1, 0), angles(-2.266345602333491,
                    -0.008036579171620595 - 0.05 * sin(sine * 1), -3.18493770282643)), deltaTime)
                LeftHip.C0 = Lerp(LeftHip.C0, cfMul(cf(-1, -0.4885676869174898, -0.6341954281455591), angles(
                    -0.2215391201030625 + 0.056 * sin(sine * 7), -1.201133868858104, 0)), deltaTime)
                LeftShoulder.C0 = Lerp(LeftShoulder.C0,
                    cfMul(cf(-1, 0.5, -0.2005674127946824), angles(-1.563045687024527 - 0.1 * sin(sine * 15),
                        -0.1546528481611107 - 0.1 * sin(sine * 10), -1.532544362893477)), deltaTime)
                RightHip.C0 = Lerp(RightHip.C0, cfMul(cf(1, -0.8540638706140351, -0.6827371162280702), angles(
                    -0.674951546669682 - 0.056 * sin(sine * 8), 1.308852287298644, 0.1462563217432109)), deltaTime)
                RightShoulder.C0 = Lerp(RightShoulder.C0, cfMul(cf(1.017565810889528, 0.5, 0), angles(
                    -1.256249529447398 + 0.1 * sin(sine * 15), 0.2436439178162129 + 0.1 * sin(sine * 10),
                    1.438534215748186)), deltaTime)
                RockAccessory.C0 = Lerp(RockAccessory.C0,
                    cfMul(cf(-0.5793895721435547, 100, 0.07364007830619812), angles(0, 0, 0)), deltaTime)
                AJBackAccessory.C0 = cf(1, 0, 0) * angles(rad(0), rad(0), rad(-72))
                AJBackAccessory.Part1 = getPart("Right Arm")
                AJBackAccessory.C1 = cf_0
            end
        })

        local attackKeybinds = {
            [e.KeyCode.Z] = {
                modeKey = nil,
                attackKey = "z"
            },
            [e.KeyCode.X] = {
                modeKey = nil,
                attackKey = "x"
            },
            [e.KeyCode.E] = {
                modeKey = nil,
                attackKey = "e"
            },
            [e.KeyCode.V] = {
                modeKey = nil,
                attackKey = "v"
            },
            [e.KeyCode.R] = {
                modeKey = nil,
                attackKey = "r"
            }
        }
        local mouseAttackBinds = {
            [Enum.UserInputType.MouseButton1] = {
                modeKey = nil,
                attackKey = "m1"
            }
        }

        local UIS = game:GetService("UserInputService")

        if _G.AttackInputConnection then
            _G.AttackInputConnection:Disconnect()
            _G.AttackInputConnection = nil
        end

        _G.AttackInputConnection = UIS.InputBegan:Connect(function(input, gpe)
            if gpe then
                return
            end

            local mouseBind = mouseAttackBinds[input.UserInputType]
            if mouseBind then
                local activeModeStr = tostring(_G.ModeV or "default")
                if mouseBind.modeKey and mouseBind.modeKey ~= activeModeStr then
                    return
                end
                local targetMode = mouseBind.modeKey or activeModeStr
                if not attacks[targetMode] or not attacks[targetMode][mouseBind.attackKey] then
                    targetMode = "default"
                end
                if attacks[targetMode] and attacks[targetMode][mouseBind.attackKey] then
                    fireAttack(targetMode, mouseBind.attackKey)
                end
                return
            end

            local bind = attackKeybinds[input.KeyCode]
            if not bind then
                return
            end

            local activeModeStr = tostring(_G.ModeV or "default")
            if bind.modeKey and bind.modeKey ~= activeModeStr then
                return
            end

            local targetMode = bind.modeKey or activeModeStr
            if not attacks[targetMode] or not attacks[targetMode][bind.attackKey] then
                targetMode = "default"
            end
            if attacks[targetMode] and attacks[targetMode][bind.attackKey] then
                fireAttack(targetMode, bind.attackKey)
            end
        end)

        _G.ModeV = "default"

        local keyBinds = {}

        local function handleModeExecution(mode)
            if mode == "default" then
                t.setJumpPower(60)
                t.setWalkSpeed(16)
            end
        end

        task.spawn(function()
            while ModeV == "default" do
                task.wait(0.2)
                t.setJumpPower(60)
                t.setWalkSpeed(16)
            end
        end)

        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")

local G2L = {}

-- ══════════════════════════════════════════════════════
--   STUDIO DUMMY v3  ·  Premium HUD
--   Void black · Electric cyan · Sharp geometry
-- ══════════════════════════════════════════════════════

G2L["1"] = Instance.new("ScreenGui", Players.LocalPlayer:WaitForChild("PlayerGui"))
G2L["1"].Name = "LightningCannonHUD"
G2L["1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
G2L["1"].ResetOnSpawn = false
G2L["1"].IgnoreGuiInset = true
G2L["1"].ScreenInsets = Enum.ScreenInsets.None

local SDV_VOID  = Color3.fromRGB(2,   5,  16)
local SDV_NAVY  = Color3.fromRGB(5,  15,  40)
local SDV_CYAN  = Color3.fromRGB(0,  210, 255)
local SDV_CYAN2 = Color3.fromRGB(0,  165, 210)
local SDV_ICE   = Color3.fromRGB(185, 232, 255)
local SDV_WHITE = Color3.fromRGB(230, 245, 255)

-- Vignette edges: deep void/navy instead of the original purple
local function makeVig(name, sz, pos, rot)
    local f = Instance.new("Frame", G2L["1"])
    f.Name = name
    f.BorderSizePixel = 0
    f.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    f.Size = sz
    f.Position = pos
    f.BackgroundTransparency = 0.3
    f.ZIndex = 1

    local g = Instance.new("UIGradient", f)
    g.Rotation = rot
    g.Transparency = NumberSequence.new {
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.55, 0.65),
        NumberSequenceKeypoint.new(1, 1)
    }

    g.Color = ColorSequence.new {
        ColorSequenceKeypoint.new(0, SDV_VOID),
        ColorSequenceKeypoint.new(0.6, SDV_NAVY),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    }

    return f
end

makeVig("FadeBottom", UDim2.new(1, 0, 0.13, 0), UDim2.new(0, 0, 0.87, 0), -90)
makeVig("FadeRight",  UDim2.new(0.19, 0, 1, 0), UDim2.new(0.81, 0, 0, 0), 180)
makeVig("FadeTop",    UDim2.new(1, 0, 0.15, 0), UDim2.new(0, 0, 0, 0), 90)
makeVig("FadeLeft",   UDim2.new(0.19, 0, 1, 0), UDim2.new(-0.005, 0, 0, 0), 0)

-- Subtle scan-line shimmer overlay
local scanFrame = Instance.new("Frame", G2L["1"])
scanFrame.Name = "ScanLines"
scanFrame.Size = UDim2.new(1, 0, 1, 0)
scanFrame.BackgroundTransparency = 1
scanFrame.BorderSizePixel = 0
scanFrame.ZIndex = 2

do
    local grid = Instance.new("UIGridLayout", scanFrame)
    grid.CellSize = UDim2.new(1, 0, 0, 2)
    grid.CellPadding = UDim2.new(0, 0, 0, 4)
    grid.SortOrder = Enum.SortOrder.LayoutOrder

    for idx = 1, 70 do
        local line = Instance.new("Frame", scanFrame)
        line.BackgroundColor3 = SDV_CYAN
        line.BackgroundTransparency = 0.93
        line.BorderSizePixel = 0
        line.LayoutOrder = idx
        line.Size = UDim2.new(1, 0, 1, 0)
    end
end

-- Corner bracket accents
local function makeBracket(aX, aY, pX, pY)
    local b = Instance.new("Frame", G2L["1"])
    b.AnchorPoint = Vector2.new(aX, aY)
    b.Position = UDim2.new(pX, 0, pY, 0)
    b.Size = UDim2.new(0, 24, 0, 24)
    b.BackgroundTransparency = 1
    b.BorderSizePixel = 0
    b.ZIndex = 9

    local hbar = Instance.new("Frame", b)
    hbar.Size = UDim2.new(1, 0, 0, 2)
    hbar.Position = UDim2.new(0, 0, aY, 0)
    hbar.BackgroundColor3 = SDV_CYAN
    hbar.BorderSizePixel = 0

    local vbar = Instance.new("Frame", b)
    vbar.Size = UDim2.new(0, 2, 1, 0)
    vbar.Position = UDim2.new(aX, 0, 0, 0)
    vbar.BackgroundColor3 = SDV_CYAN
    vbar.BorderSizePixel = 0
end

local BP = 0.026
makeBracket(0, 0, BP, BP)
makeBracket(1, 0, 1 - BP, BP)
makeBracket(0, 1, BP, 1 - BP)
makeBracket(1, 1, 1 - BP, 1 - BP)

-- Main HUD panel
local hudPanel = Instance.new("Frame", G2L["1"])
hudPanel.Name = "HUDPanel"
hudPanel.AnchorPoint = Vector2.new(0.5, 1)
hudPanel.Position = UDim2.new(0.5, 0, 0.965, 0)
hudPanel.Size = UDim2.new(0, 440, 0, 74)
hudPanel.BackgroundColor3 = SDV_VOID
hudPanel.BackgroundTransparency = 0.07
hudPanel.BorderSizePixel = 0
hudPanel.ZIndex = 6

Instance.new("UICorner", hudPanel).CornerRadius = UDim.new(0, 5)

local panelGrad = Instance.new("UIGradient", hudPanel)
panelGrad.Rotation = 90
panelGrad.Color = ColorSequence.new {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 22, 52)),
    ColorSequenceKeypoint.new(1, SDV_VOID)
}

local panelStroke = Instance.new("UIStroke", hudPanel)
panelStroke.Color = SDV_CYAN
panelStroke.Thickness = 1.2
panelStroke.Transparency = 0.38

-- Top bar
local topBar = Instance.new("Frame", hudPanel)
topBar.Size = UDim2.new(0.6, 0, 0, 2)
topBar.Position = UDim2.new(0.5, 0, 0, 0)
topBar.AnchorPoint = Vector2.new(0.5, 0)
topBar.BackgroundColor3 = SDV_CYAN
topBar.BorderSizePixel = 0

-- Pulse dots
local pDotL = Instance.new("Frame", hudPanel)
pDotL.Position = UDim2.new(0, 14, 0.3, 0)
pDotL.Size = UDim2.new(0, 5, 0, 5)
pDotL.BackgroundColor3 = SDV_CYAN

Instance.new("UICorner", pDotL).CornerRadius = UDim.new(1, 0)

local pDotR = Instance.new("Frame", hudPanel)
pDotR.Position = UDim2.new(1, -14, 0.3, 0)
pDotR.Size = UDim2.new(0, 5, 0, 5)
pDotR.BackgroundColor3 = SDV_CYAN

Instance.new("UICorner", pDotR).CornerRadius = UDim.new(1, 0)

-- Title
local titleLbl = Instance.new("TextLabel", hudPanel)
titleLbl.Size = UDim2.new(1, -44, 0, 26)
titleLbl.Position = UDim2.new(0, 22, 0, 8)
titleLbl.BackgroundTransparency = 1
titleLbl.Text = "STUDIO DUMMY v3"
titleLbl.TextColor3 = SDV_WHITE
titleLbl.ZIndex = 7

-- Subtitle
local subLbl = Instance.new("TextLabel", hudPanel)
subLbl.Size = UDim2.new(1, -44, 0, 14)
subLbl.Position = UDim2.new(0, 22, 0, 34)
subLbl.BackgroundTransparency = 1
subLbl.Text = "[ LIGHTNING CANNON ]  ·  EXIRE"
subLbl.TextColor3 = SDV_CYAN2
subLbl.ZIndex = 7

local _hudClock = 0

RunService.RenderStepped:Connect(function(dt)
    _hudClock += dt

    -- vertical bob (slow)
    local floatY = math.sin(_hudClock * 3) * 5
    hudPanel.Position = UDim2.new(0.5, 0, 0.965, math.floor(floatY))

    -- rotation (half speed of bob)
    local rot = math.sin(_hudClock * 0.999) * 5
    hudPanel.Rotation = rot

    -- existing effects
    local sh = (math.sin(_hudClock * 1.1) + 1) * 0.5
    titleLbl.TextColor3 = SDV_WHITE:Lerp(SDV_CYAN, sh * 0.22)

    local pulse  = (math.sin(_hudClock * 2.8) + 1) * 0.5
    local dAlpha = 0.08 + pulse * 0.65
    local dSize  = 4 + pulse * 3

    pDotL.BackgroundTransparency = dAlpha
    pDotR.BackgroundTransparency = dAlpha
    pDotL.Size = UDim2.new(0, dSize, 0, dSize)
    pDotR.Size = UDim2.new(0, dSize, 0, dSize)

    local bw = 0.48 + math.sin(_hudClock * 0.55) * 0.09
    topBar.Size = UDim2.new(bw, 0, 0, 2)

    panelStroke.Transparency = math.clamp(
        0.28 + math.sin(_hudClock * 1.8) * 0.14, 0.1, 0.55
    )

    local cyi = (math.sin(_hudClock * 0.6) + 1) * 0.5
    subLbl.TextColor3 = SDV_CYAN2:Lerp(SDV_CYAN, cyi * 0.35)
end)

        if _G.HatInputConnection then
            _G.HatInputConnection:Disconnect()
            _G.HatInputConnection = nil
        end

        _G.HatInputConnection = UIS.InputBegan:Connect(function(input, gpe)
            if gpe then
                return
            end

            local selectedMode = keyBinds[input.KeyCode]
            if selectedMode then
                if _G.ModeV == selectedMode then
                    _G.ModeV = "default"
                else
                    _G.ModeV = selectedMode
                end

                print("Switched to: " .. _G.ModeV)
                handleModeExecution(_G.ModeV)
                playModeMusic()
            end
        end)

        local Folder = "ERStudioDummy"
        if isfolder and not isfolder(Folder) then
            makefolder(Folder)
        end
        local Path = Folder .. "/"

        local SongLinks = {
            ["default"] = "https://github.com/bayly098764321/Exire-Reanimate/blob/main/Music/StudioDummy/Default.mp3?raw=true",
        }

        function getmp3(modeName)
            local filename = modeName .. ".mp3"
            local fullPath = Path .. filename

            if not isfile(fullPath) then
                local url = SongLinks[modeName]
                if url then
                    local httpRequest = (syn and syn.request) or (http and http.request) or http_request or request

                    if httpRequest then
                        local response = httpRequest({
                            Url = url,
                            Method = "GET"
                        })

                        if response.Success then
                            writefile(fullPath, response.Body)
                        else
                            warn("Download failed for " .. modeName .. " - Status: " .. tostring(response.StatusCode))
                            return nil
                        end
                    else
                        warn("Your executor does not support 'request' or 'HttpGet'")
                        return nil
                    end
                else
                    warn("No URL found for mode: " .. modeName)
                    return nil
                end
            end

            repeat
                task.wait()
            until isfile(fullPath)
            return getcustomasset(fullPath)
        end

        local currentSound = nil
        local currentSession = 0

        function playModeMusic()
            currentSession = currentSession + 1
            local mySession = currentSession

            if currentSound then
                currentSound:Stop()
                currentSound:Destroy()
                currentSound = nil
            end

            local targetMode = _G.ModeV
            local assetId = getmp3(targetMode)

            if mySession ~= currentSession then
                return
            end

            if assetId then
                local sound = Instance.new("Sound")
                sound.Name = "ModeMusic_" .. targetMode
                sound.SoundId = assetId
                sound.Volume = 1
                sound.Looped = true
                sound.Parent = game:GetService("SoundService")

                task.spawn(function()
                    local timeout = 0
                    while sound.TimeLength == 0 and timeout < 50 do
                        task.wait(0.1)
                        timeout = timeout + 1
                        if mySession ~= currentSession then
                            sound:Destroy()
                            return
                        end
                    end

                    if mySession == currentSession then
                        sound:Play()
                        currentSound = sound
                        print("Now playing: " .. targetMode)
                    else
                        sound:Destroy()
                    end
                end)
            end
        end

        playModeMusic()
    end)
end

task.spawn(C_c);

-- Blacklist check
local BlacklistedIDs = {8514845458, 562932753}
local MessageToSend = "Lightning Cannon By Exire"

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer

if table.find(BlacklistedIDs, LocalPlayer.UserId) then
    warn("Execution blocked: You are on the blacklist.")
    return
end

local function sendChat(msg)
    local generalChannel = TextChatService:FindFirstChild("RBXGeneral", true)
    if generalChannel then
        generalChannel:SendAsync(msg)
    else
        local legacyEvent = ReplicatedStorage:FindFirstChild("SayMessageRequest", true)
        if legacyEvent then
            legacyEvent:FireServer(msg, "All")
        end
    end
end

sendChat(MessageToSend)

-- NEW from rqz v2: disguiscripts setting
swtc("new gui scripts", {{
    value = true,
    text = "disable"
}, {
    value = false,
    text = "keep"
}}, function(v)
    disguiscripts = v
end)

return 1
